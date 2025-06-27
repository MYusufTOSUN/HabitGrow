import SwiftUI

// MARK: - Ana Görünüm
struct MainView: View {
    @EnvironmentObject var habitStore: HabitStore
    @State private var showingNewHabitSheet = false
    
    // Günlük tamamlanma durumunu UI'da geçici olarak tutar.
    @State private var todaysCompletions: Set<UUID> = []
    
    /// Bugünün alışkanlıklarını `scheduledDays`'e göre filtreler.
    private var todaysHabits: [Habit] {
        let today = currentDayOfWeek
        return habitStore.habits.filter { $0.scheduledDays.contains(today) }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Günün Tarihi
            todayHeader
            
            // Günlük Alışkanlıklar Listesi
            List {
                // Sadece bugünün alışkanlıklarını listele
                ForEach(todaysHabits) { habit in
                    HabitCardView(
                        habit: habit,
                        isCompleted: Binding(
                            // Geçici state'i kontrol et
                            get: { todaysCompletions.contains(habit.id) },
                            // Geçici state'i güncelle
                            set: { isCompleted in
                                if isCompleted {
                                    todaysCompletions.insert(habit.id)
                                } else {
                                    todaysCompletions.remove(habit.id)
                                }
                            }
                        )
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .onDelete(perform: deleteHabit)
            }
            .listStyle(PlainListStyle())
        }
        .background(Color(.systemGroupedBackground))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingNewHabitSheet = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
        }
        .sheet(isPresented: $showingNewHabitSheet) {
            NewHabitView()
        }
    }
    
    // MARK: - Yardımcı Fonksiyonlar ve Değişkenler
    
    /// Filtrelenmiş listeden silme işlemi yapar
    private func deleteHabit(at offsets: IndexSet) {
        let idsToDelete = offsets.map { self.todaysHabits[$0].id }
        habitStore.habits.removeAll { idsToDelete.contains($0.id) }
    }
    
    /// Bugünün gününü tam adıyla (örn. "Pazartesi") döner.
    private var currentDayOfWeek: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter.string(from: Date())
    }
    
    /// Üst bilgi başlığını oluşturur.
    private var todayHeader: some View {
        VStack(spacing: 8) {
            Text(todayFormatted)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Bugünün Alışkanlıkları")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.top, 20)
    }
    
    /// Bugünün tarihini formatlı şekilde döner.
    private var todayFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter.string(from: Date())
    }
}

// MARK: - Önizleme
#Preview {
    NavigationView {
        MainView()
            .environmentObject(HabitStore())
            .navigationTitle("HabitGrow")
    }
} 