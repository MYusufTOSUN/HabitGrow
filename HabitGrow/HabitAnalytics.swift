import Foundation
import SwiftUI

// MARK: - Alışkanlık Analizleri
/// Alışkanlık verilerini analiz etmek ve istatistikler üretmek için yardımcı yapı.
struct HabitAnalytics {
    let habits: [Habit]
    
    // MARK: - Genel İstatistikler
    
    /// Toplam oluşturulmuş alışkanlık sayısı.
    var totalHabitsCount: Int {
        habits.count
    }
    
    /// Son 7 gün içinde tamamlanan toplam görev sayısı.
    /// - Note: Bu özellik şu anda dummy veri döndürmektedir.
    var completionsLast7Days: Int {
        // Gelecekte gerçek veri takibi eklenecek.
        // Şimdilik, toplam alışkanlıkların %50'sini tamamlamış gibi bir varsayım yapalım.
        return Int(Double(habits.count * 7) * 0.5)
    }
    
    /// Haftalık başarı yüzdesi.
    /// - Note: Bu özellik şu anda dummy veri döndürmektedir.
    var weeklySuccessRate: Double {
        // Gelecekte gerçek veri takibi eklenecek.
        // Şimdilik %0 ile %100 arasında rastgele bir değer döndürelim.
        return Double.random(in: 40...95)
    }
    
    /// En sık tamamlanan alışkanlık.
    /// - Note: Bu özellik şu anda dummy veri döndürmektedir.
    var mostCompletedHabit: Habit? {
        // Gelecekte gerçek veri takibi eklenecek.
        // Şimdilik listedeki ilk alışkanlığı döndürelim.
        return habits.first
    }
    
    // MARK: - Grafik Verileri
    
    /// Son 7 gün için bar chart verilerini oluşturur.
    /// - Note: Bu özellik şu anda dummy veri döndürmektedir.
    var dailyCompletionData: [BarChartDataPoint] {
        let weekdays = ["Pzt", "Sal", "Çar", "Per", "Cum", "Cmt", "Paz"]
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
        
        return zip(weekdays, colors).map { day, color in
            // Her gün için 0 ile 8 arasında rastgele bir tamamlanma sayısı üret.
            let randomValue = Double.random(in: 0...8)
            return BarChartDataPoint(value: randomValue, label: day, color: color)
        }
    }
} 