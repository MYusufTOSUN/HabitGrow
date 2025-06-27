import SwiftUI

// MARK: - İstatistik Görünümü
struct StatsView: View {
    @EnvironmentObject var habitStore: HabitStore
    
    // Analiz için bir örneğini oluşturur
    private var analytics: HabitAnalytics {
        HabitAnalytics(habits: habitStore.habits)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Başlık
                headerView
                
                // Genel İstatistik Kartları
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    StatCard(title: "Toplam Alışkanlık", value: "\(analytics.totalHabitsCount)", icon: "target", color: .blue)
                    StatCard(title: "Haftalık Başarı", value: String(format: "%.1f%%", analytics.weeklySuccessRate), icon: "chart.pie.fill", color: .green)
                    StatCard(title: "7 Günlük Tamamlama", value: "\(analytics.completionsLast7Days)", icon: "checkmark.circle.fill", color: .orange)
                }
                
                // En Popüler Alışkanlık Kartı
                mostCompletedHabitCard
                
                // Haftalık İlerleme Grafiği
                BarChartView(dataPoints: analytics.dailyCompletionData)
                
                Spacer()
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("İstatistikler")
    }
    
    // MARK: - Alt Görünümler
    
    /// Sayfa başlığı
    private var headerView: some View {
        VStack(alignment: .leading) {
            Text("İlerleme Özeti")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Alışkanlık performansınıza genel bakış")
                .foregroundColor(.secondary)
        }
    }
    
    /// En sık tamamlanan alışkanlık kartı
    @ViewBuilder
    private var mostCompletedHabitCard: some View {
        if let habit = analytics.mostCompletedHabit {
            VStack(alignment: .leading, spacing: 12) {
                Text("En Sık Tamamlanan")
                    .font(.headline)
                
                HStack {
                    Text(habit.emoji)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text(habit.title)
                            .fontWeight(.semibold)
                        Text("Bu alışkanlıkta harikasınız!")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
        }
    }
}

// MARK: - İstatistik Kartı Bileşeni
struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Spacer()
            }
            Text(value)
                .font(.title)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}


// MARK: - Önizleme
#Preview {
    NavigationView {
        StatsView()
            .environmentObject(HabitStore())
    }
} 