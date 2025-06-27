import SwiftUI

// MARK: - Bar Chart Veri Modeli
struct BarChartDataPoint: Identifiable {
    let id = UUID()
    let value: Double
    let label: String
    var color: Color = .blue
}

// MARK: - Bar Chart Görünümü
struct BarChartView: View {
    let dataPoints: [BarChartDataPoint]
    
    // Grafikteki en yüksek değeri bulur
    private var maxValue: Double {
        dataPoints.map { $0.value }.max() ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Başlık
            Text("Son 7 Günlük İlerleme")
                .font(.headline)
                .foregroundColor(.primary)
            
            // Grafik Alanı
            HStack(alignment: .bottom, spacing: 12) {
                ForEach(dataPoints) { dataPoint in
                    VStack {
                        // Bar
                        RoundedRectangle(cornerRadius: 6)
                            .fill(dataPoint.color)
                            .frame(height: barHeight(for: dataPoint.value))
                        
                        // Etiket
                        Text(dataPoint.label)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .frame(height: 150)
            .padding(.top, 10)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
            )
            .padding(.horizontal, 4)
        }
    }
    
    /// Verilen değere göre bar'ın yüksekliğini hesaplar
    private func barHeight(for value: Double) -> CGFloat {
        // Eğer max değer 0 ise, bar yüksekliği 0 olmalı
        guard maxValue > 0 else { return 0 }
        
        // Değeri 0-150 arasına orantılar
        let height = (value / maxValue) * 150
        return CGFloat(height)
    }
}

// MARK: - Önizleme
#Preview {
    let sampleData: [BarChartDataPoint] = [
        .init(value: 3, label: "Pzt", color: .red),
        .init(value: 5, label: "Sal", color: .orange),
        .init(value: 2, label: "Çar", color: .yellow),
        .init(value: 4, label: "Per", color: .green),
        .init(value: 6, label: "Cum", color: .blue),
        .init(value: 1, label: "Cmt", color: .indigo),
        .init(value: 7, label: "Paz", color: .purple)
    ]
    
    return BarChartView(dataPoints: sampleData)
        .padding()
} 