import SwiftUI

// MARK: - Yeni Alışkanlık Oluşturma Görünümü
struct NewHabitView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var habitStore: HabitStore
    
    // Form state'leri
    @State private var title: String = ""
    @State private var selectedEmoji: String = "💧"
    @State private var selectedColor: Color = .blue
    @State private var selectedDays: Set<WeekDay> = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Başlık alanı
                    titleSection
                    
                    // Emoji seçici
                    EmojiPickerView(selectedEmoji: $selectedEmoji)
                    
                    // Renk seçici
                    ColorPickerView(selectedColor: $selectedColor)
                    
                    // Gün seçici
                    WeekdaySelectorView(selectedDays: $selectedDays)
                    
                    Spacer(minLength: 50)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            .navigationTitle("Yeni Alışkanlık")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("İptal") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Kaydet") {
                        saveHabit()
                    }
                    .fontWeight(.semibold)
                    .disabled(!isFormValid)
                }
            }
        }
    }
    
    // MARK: - Başlık Bölümü
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Alışkanlık adı")
                .font(.headline)
                .foregroundColor(.primary)
            
            TextField("Örn: Su İç", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.body)
        }
    }
    
    // MARK: - Form Validasyonu
    private var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !selectedDays.isEmpty
    }
    
    // MARK: - Alışkanlık Kaydetme
    private func saveHabit() {
        let newHabit = Habit(
            title: title.trimmingCharacters(in: .whitespacesAndNewlines),
            emoji: selectedEmoji,
            color: selectedColor,
            scheduledDays: selectedDays.map { $0.rawValue }
        )
        
        // Alışkanlığı store'a ekle
        habitStore.addHabit(newHabit)
        
        // Formu kapat
        dismiss()
    }
}

// MARK: - Önizleme
#Preview {
    NewHabitView()
        .environmentObject(HabitStore())
} 