import SwiftUI
import Foundation

// MARK: - Alışkanlık Veri Deposu
class HabitStore: ObservableObject {
    @Published var habits: [Habit] = [] {
        // Alışkanlıklar güncellendiğinde UserDefaults'a kaydet
        didSet {
            saveHabits()
        }
    }
    
    private let userDefaultsKey = "habitStore"
    
    // Alışkanlıkları yükle
    init() {
        loadHabits()
    }
    
    // MARK: - Veri İşlemleri
    
    /// Yeni bir alışkanlık ekler
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
    
    /// Belirtilen index set'indeki alışkanlıkları siler
    func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
    
    /// Bir alışkanlığın tamamlandı durumunu günceller
    func toggleCompletion(for habitID: UUID) {
        if let index = habits.firstIndex(where: { $0.id == habitID }) {
            habits[index].isCompleted.toggle()
        }
    }
    
    // MARK: - UserDefaults Entegrasyonu
    
    /// Alışkanlıkları UserDefaults'tan yükler
    private func loadHabits() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            // Eğer veri yoksa, örnek verileri yükle
            self.habits = SampleHabits.habits
            return
        }
        
        do {
            let decoder = JSONDecoder()
            self.habits = try decoder.decode([Habit].self, from: data)
        } catch {
            print("🚨 Alışkanlıklar yüklenirken hata oluştu: \(error.localizedDescription)")
            // Hata durumunda örnek verileri yükle
            self.habits = SampleHabits.habits
        }
    }
    
    /// Alışkanlıkları UserDefaults'a JSON olarak kaydeder
    private func saveHabits() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(habits)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("🚨 Alışkanlıklar kaydedilirken hata oluştu: \(error.localizedDescription)")
        }
    }
} 