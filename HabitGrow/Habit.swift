import SwiftUI
import Foundation

// MARK: - Alışkanlık Veri Modeli
struct Habit: Identifiable, Codable {
    let id: UUID
    var title: String
    var emoji: String
    var color: Color
    var scheduledDays: [String]
    var isCompleted: Bool
    
    // Color tipini Codable yapmak için özel kodlama anahtarları
    enum CodingKeys: String, CodingKey {
        case id, title, emoji, scheduledDays, isCompleted
        case colorRed, colorGreen, colorBlue, colorOpacity
    }
    
    // Alışkanlık oluşturucu
    init(id: UUID = UUID(), title: String, emoji: String, color: Color, scheduledDays: [String], isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.emoji = emoji
        self.color = color
        self.scheduledDays = scheduledDays
        self.isCompleted = isCompleted
    }
    
    // Decoder'dan veri çözme
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        emoji = try container.decode(String.self, forKey: .emoji)
        scheduledDays = try container.decode([String].self, forKey: .scheduledDays)
        isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        
        let red = try container.decode(Double.self, forKey: .colorRed)
        let green = try container.decode(Double.self, forKey: .colorGreen)
        let blue = try container.decode(Double.self, forKey: .colorBlue)
        let opacity = try container.decode(Double.self, forKey: .colorOpacity)
        color = Color(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    // Encoder'a veri kodlama
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(emoji, forKey: .emoji)
        try container.encode(scheduledDays, forKey: .scheduledDays)
        try container.encode(isCompleted, forKey: .isCompleted)
        
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &opacity)
        
        try container.encode(red, forKey: .colorRed)
        try container.encode(green, forKey: .colorGreen)
        try container.encode(blue, forKey: .colorBlue)
        try container.encode(opacity, forKey: .colorOpacity)
    }
} 