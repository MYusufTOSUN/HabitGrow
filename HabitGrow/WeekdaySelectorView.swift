import SwiftUI

// MARK: - Haftanın Günleri Seçici Görünümü
struct WeekdaySelectorView: View {
    @Binding var selectedDays: Set<WeekDay>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Başlık
            Text("Hangi günler?")
                .font(.headline)
                .foregroundColor(.primary)
            
            // Gün butonları
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 8) {
                ForEach(WeekDay.allCases) { day in
                    WeekdayButton(
                        day: day,
                        isSelected: selectedDays.contains(day),
                        action: {
                            if selectedDays.contains(day) {
                                selectedDays.remove(day)
                            } else {
                                selectedDays.insert(day)
                            }
                        }
                    )
                }
            }
        }
    }
}

// MARK: - Gün Butonu
struct WeekdayButton: View {
    let day: WeekDay
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(day.shortName)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .white : .primary)
                .frame(maxWidth: .infinity)
                .frame(height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.blue : Color(.systemGray5))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Önizleme
#Preview {
    WeekdaySelectorView(selectedDays: .constant([.monday, .wednesday, .friday]))
        .padding()
} 