import Foundation

// MARK: - Haftanın Günleri
enum WeekDay: String, CaseIterable, Identifiable {
    case monday = "Pazartesi"
    case tuesday = "Salı"
    case wednesday = "Çarşamba"
    case thursday = "Perşembe"
    case friday = "Cuma"
    case saturday = "Cumartesi"
    case sunday = "Pazar"
    
    var id: String { rawValue }
    
    var shortName: String {
        switch self {
        case .monday: return "Pzt"
        case .tuesday: return "Sal"
        case .wednesday: return "Çar"
        case .thursday: return "Per"
        case .friday: return "Cum"
        case .saturday: return "Cmt"
        case .sunday: return "Paz"
        }
    }
} 