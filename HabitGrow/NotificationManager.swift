import UserNotifications
import Foundation

// MARK: - Bildirim Yöneticisi
/// Uygulama içi bildirimleri yönetmek için singleton sınıf.
class NotificationManager {
    static let shared = NotificationManager()
    private init() {}
    
    /// Kullanıcıdan bildirim izni ister.
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (granted, error) in
            if let error = error {
                print("🚨 Bildirim izni hatası: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    /// Her gün belirtilen saatte tekrarlayan bir hatırlatıcı planlar.
    /// - Parameters:
    ///   - hour: Hatırlatıcının gönderileceği saat (24 saat formatında).
    ///   - minute: Hatırlatıcının gönderileceği dakika.
    func scheduleDailyReminder(at hour: Int, minute: Int) {
        // Bildirim içeriğini oluştur
        let content = UNMutableNotificationContent()
        content.title = "HabitGrow"
        content.body = "Bugünkü alışkanlıklarını tamamlamayı unutma! 💪"
        content.sound = .default
        
        // Bildirim tetikleyicisini oluştur (her gün aynı saatte)
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Bildirim isteğini oluştur
        let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
        
        // İsteği planla
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("🚨 Bildirim planlama hatası: \(error.localizedDescription)")
            } else {
                print("✅ Günlük hatırlatıcı başarıyla kuruldu: \(hour):\(String(format: "%02d", minute))")
            }
        }
    }
    
    /// Planlanmış tüm bildirimleri iptal eder.
    func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("ℹ️ Tüm planlanmış bildirimler iptal edildi.")
    }
} 