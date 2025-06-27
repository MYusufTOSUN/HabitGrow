import SwiftUI

// MARK: - Hakkında Görünümü
struct AboutView: View {
    // Uygulama versiyonunu Bundle'dan alır
    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Bilinmiyor"
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                // Logo
                Text("HabitGrow")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.green)
                
                // Amaç
                VStack(alignment: .leading, spacing: 12) {
                    Text("Projenin Amacı")
                        .font(.headline)
                    Text("Bu uygulama, günlük alışkanlıkları takip etmeyi kolaylaştırmak ve kullanıcıları motive etmek için geliştirilmiş bir SwiftUI projesidir. Temiz kod, modüler mimari ve en iyi pratikler hedeflenmiştir.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                // Geliştirici Bilgileri
                VStack(alignment: .leading, spacing: 12) {
                    Text("Geliştirici")
                        .font(.headline)
                    Text("Bu proje, yapay zeka destekli bir kod asistanı tarafından geliştirilmiştir.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Versiyon Bilgisi
                Text("Versiyon \(appVersion)")
                    .font(.caption)
                    .foregroundColor(.tertiary)
            }
            .padding()
            .multilineTextAlignment(.leading)
        }
        .navigationTitle("Hakkında")
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Önizleme
#Preview {
    NavigationView {
        AboutView()
    }
} 