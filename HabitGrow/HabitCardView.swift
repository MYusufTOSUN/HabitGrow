import SwiftUI

// MARK: - Alışkanlık Kartı Görünümü
struct HabitCardView: View {
    let habit: Habit
    @Binding var isCompleted: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            // Emoji
            Text(habit.emoji)
                .font(.title)
                .frame(width: 50, height: 50)
            
            // Alışkanlık Başlığı
            Text(habit.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            // Tamamlandı Butonu
            Button(action: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isCompleted.toggle()
                }
            }) {
                ZStack {
                    Circle()
                        .fill(isCompleted ? habit.color : Color.gray.opacity(0.2))
                        .frame(width: 32, height: 32)
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        .opacity(isCompleted ? 0.5 : 1.0) // Tamamlandığında %50 opaklık
    }
}

// MARK: - Önizleme
#Preview {
    VStack(spacing: 16) {
        HabitCardView(
            habit: SampleHabits.habits[0],
            isCompleted: .constant(false)
        )
        
        HabitCardView(
            habit: SampleHabits.habits[1],
            isCompleted: .constant(true)
        )
    }
    .padding()
    .background(Color(.systemGroupedBackground))
} 