import SwiftUI

// MARK: - Ayarlar Görünümü
struct SettingsView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    // Geçici state'ler
    @State private var language = "Türkçe" // "English"
    @State private var remindersEnabled = false
    
    var body: some View {
        Form {
            // Görünüm Ayarları
            Section(header: Text("Görünüm")) {
                themePicker
            }
            
            // Genel Ayarlar
            Section(header: Text("Genel")) {
                // Hatırlatıcı ayarlarına yönlendirme
                NavigationLink(destination: ReminderSettingsView()) {
                    Label("Hatırlatıcılar", systemImage: "bell.fill")
                }
                languagePicker
            }
            
            // Hakkında Bölümü
            Section {
                NavigationLink(destination: AboutView()) {
                    Label("Hakkında", systemImage: "info.circle")
                }
            }
        }
        .navigationTitle("Ayarlar")
    }
    
    // MARK: - Alt Görünümler
    
    /// Tema seçimi için Picker
    private var themePicker: some View {
        Picker("Tema", selection: $themeManager.theme) {
            ForEach(ThemeOption.allCases) { theme in
                Text(theme.rawValue).tag(theme)
            }
        }
        .onChange(of: themeManager.theme) { newTheme in
            themeManager.setTheme(newTheme)
        }
    }
    
    /// Dil seçimi için Picker
    private var languagePicker: some View {
        Picker("Dil", selection: $language) {
            Text("Türkçe").tag("Türkçe")
            Text("English").tag("English")
        }
        .pickerStyle(SegmentedPickerStyle())
        // Not: Gerçek dil değişikliği için bir LanguageManager gereklidir.
    }
    
    /// Hatırlatıcılar için Toggle
    private var remindersToggle: some View {
        Toggle(isOn: $remindersEnabled) {
            Label("Hatırlatıcılar", systemImage: "bell.fill")
        }
        // Not: Gerçek bildirim yönetimi için bir NotificationManager gereklidir.
    }
}

// MARK: - Önizleme
#Preview {
    NavigationView {
        SettingsView()
            .environmentObject(ThemeManager())
    }
} 