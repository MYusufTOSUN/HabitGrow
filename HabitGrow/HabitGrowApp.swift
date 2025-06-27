import SwiftUI

@main
struct HabitGrowApp: App {
    @StateObject private var habitStore = HabitStore()
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habitStore)
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.theme.colorScheme)
        }
    }
} 