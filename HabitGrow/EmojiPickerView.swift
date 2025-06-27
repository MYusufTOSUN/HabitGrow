import SwiftUI

// MARK: - Emoji Seçici Görünümü
struct EmojiPickerView: View {
    @Binding var selectedEmoji: String
    
    // Kullanılabilir emojiler
    private let availableEmojis: [String] = [
        "💧", "🏃‍♂️", "📚", "🧘‍♀️", "🦷", "💪", "🧠", "❤️",
        "🌟", "⭐", "🔥", "💎", "🎯", "🎨", "🎵", "🎮",
        "🍎", "🥗", "💊", "🛏️", "🚶‍♂️", "🏋️‍♂️", "🧘‍♂️", "🏊‍♂️",
        "🚴‍♂️", "🎾", "⚽", "🏀", "🎸", "🎹", "📝", "✏️"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Başlık
            Text("Emoji seçin")
                .font(.headline)
                .foregroundColor(.primary)
            
            // Emoji listesi
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(availableEmojis, id: \.self) { emoji in
                        EmojiButton(
                            emoji: emoji,
                            isSelected: selectedEmoji == emoji,
                            action: {
                                selectedEmoji = emoji
                            }
                        )
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
}

// MARK: - Emoji Butonu
struct EmojiButton: View {
    let emoji: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(emoji)
                .font(.system(size: 32))
                .frame(width: 50, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isSelected ? Color.blue.opacity(0.2) : Color(.systemGray6))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Önizleme
#Preview {
    EmojiPickerView(selectedEmoji: .constant("💧"))
        .padding()
} 