import SwiftUI

// MARK: - Hatırlatıcı Ayarları Görünümü
struct ReminderSettingsView: View {
    // Kullanıcının ayarlarını UserDefaults'ta saklar
    @AppStorage("remindersEnabled") private var remindersEnabled = false
    @AppStorage("reminderTime") private var reminderTimeData: Data = Data()
    
    // DatePicker için state
    @State private var reminderTime: Date
    
    init() {
        // Kaydedilmiş saat verisini Date'e çevir, yoksa varsayılan olarak 08:00 kullan
        if let decodedTime = try? JSONDecoder().decode(Date.self, from: reminderTimeData) {
            _reminderTime = State(initialValue: decodedTime)
        } else {
            var components = DateComponents()
            components.hour = 8
            components.minute = 0
            _reminderTime = State(initialValue: Calendar.current.date(from: components) ?? Date())
        }
    }
    
    var body: some View {
        Form {
            Section(
                header: Text("Günlük Hatırlatıcı"),
                footer: Text("Her gün seçtiğiniz saatte alışkanlıklarınızı tamamlamanız için bir bildirim gönderilir.")
            ) {
                // Hatırlatıcıları aç/kapat
                Toggle("Hatırlatıcılar Aktif", isOn: $remindersEnabled)
                    .onChange(of: remindersEnabled, perform: handleToggleChange)
                
                // Eğer hatırlatıcılar aktifse, saat seçiciyi göster
                if remindersEnabled {
                    DatePicker("Hatırlatma Saati", selection: $reminderTime, displayedComponents: .hourAndMinute)
                        .onChange(of: reminderTime, perform: scheduleNotification)
                }
            }
        }
        .navigationTitle("Hatırlatıcı Ayarları")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Yardımcı Fonksiyonlar
    
    /// Toggle durumu değiştiğinde çalışır.
    private func handleToggleChange(enabled: Bool) {
        if enabled {
            // İzin iste ve izin verilirse bildirimi planla
            NotificationManager.shared.requestAuthorization { granted in
                if granted {
                    scheduleNotification(from: reminderTime)
                } else {
                    // Kullanıcı izin vermediyse toggle'ı geri kapat
                    remindersEnabled = false
                }
            }
        } else {
            // Tüm bildirimleri iptal et
            NotificationManager.shared.cancelAllNotifications()
        }
    }
    
    /// Seçilen saate göre bildirimi planlar.
    private func scheduleNotification(from date: Date) {
        // Saati ve dakikayı al
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        guard let hour = components.hour, let minute = components.minute else { return }
        
        // Bildirimi planla
        NotificationManager.shared.scheduleDailyReminder(at: hour, minute: minute)
        
        // Seçilen saati kaydet
        if let encodedTime = try? JSONEncoder().encode(date) {
            reminderTimeData = encodedTime
        }
    }
}

// MARK: - Önizleme
#Preview {
    NavigationView {
        ReminderSettingsView()
    }
} 