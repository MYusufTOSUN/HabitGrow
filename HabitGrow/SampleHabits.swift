import SwiftUI

// MARK: - Örnek Alışkanlık Verileri
struct SampleHabits {
    static let habits = [
        Habit(
            title: "Su İç",
            emoji: "💧",
            color: .blue,
            scheduledDays: ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"]
        ),
        Habit(
            title: "Yürüyüş Yap",
            emoji: "🚶‍♂️",
            color: .green,
            scheduledDays: ["Pazartesi", "Çarşamba", "Cuma"]
        ),
        Habit(
            title: "Kitap Oku",
            emoji: "📚",
            color: .orange,
            scheduledDays: ["Salı", "Perşembe", "Cumartesi"]
        )
    ]
} 