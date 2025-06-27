import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Ana Ekran
            NavigationView {
                MainView()
                    .navigationTitle("HabitGrow")
            }
            .tabItem {
                Label("Alışkanlıklar", systemImage: "list.bullet")
            }
            
            // İstatistik Ekranı
            NavigationView {
                StatsView()
            }
            .tabItem {
                Label("İstatistikler", systemImage: "chart.bar.xaxis")
            }
            
            // Ayarlar Ekranı
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Ayarlar", systemImage: "gear")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(HabitStore())
        .environmentObject(ThemeManager())
} 