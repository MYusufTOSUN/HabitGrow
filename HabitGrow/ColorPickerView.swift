import SwiftUI

// MARK: - Renk Seçici Görünümü
struct ColorPickerView: View {
    @Binding var selectedColor: Color
    
    // Kullanılabilir renkler
    private let availableColors: [Color] = [
        .blue, .green, .orange, .red, .purple, .pink,
        .yellow, .mint, .teal, .indigo, .brown, .cyan
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Başlık
            Text("Renk seçin")
                .font(.headline)
                .foregroundColor(.primary)
            
            // Renk butonları
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 12) {
                ForEach(availableColors, id: \.self) { color in
                    ColorButton(
                        color: color,
                        isSelected: selectedColor == color,
                        action: {
                            selectedColor = color
                        }
                    )
                }
            }
        }
    }
}

// MARK: - Renk Butonu
struct ColorButton: View {
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 44, height: 44)
                
                // Seçili durumda çerçeve
                if isSelected {
                    Circle()
                        .stroke(Color.primary, lineWidth: 3)
                        .frame(width: 50, height: 50)
                    
                    // Checkmark ikonu
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Önizleme
#Preview {
    ColorPickerView(selectedColor: .constant(.blue))
        .padding()
} 