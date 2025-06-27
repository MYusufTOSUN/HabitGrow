import XCTest
@testable import HabitGrow

final class HabitGrowTests: XCTestCase {
    
    func testHabitModelCreation() throws {
        let habit = Habit(
            title: "Test Habit",
            emoji: "🧪",
            color: .red,
            scheduledDays: ["Pazartesi", "Çarşamba", "Cuma"]
        )
        
        XCTAssertEqual(habit.title, "Test Habit")
        XCTAssertEqual(habit.emoji, "🧪")
        XCTAssertEqual(habit.color, .red)
        XCTAssertEqual(habit.scheduledDays.count, 3)
        XCTAssertFalse(habit.isCompleted)
    }
    
    func testWeekDayLocalization() throws {
        XCTAssertEqual(WeekDay.monday.shortName, "Pzt")
        XCTAssertEqual(WeekDay.monday.fullName, "Pazartesi")
        XCTAssertEqual(WeekDay.sunday.shortName, "Paz")
        XCTAssertEqual(WeekDay.sunday.fullName, "Pazar")
    }
    
    func testColorHexConversion() throws {
        let redColor = Color(hex: "#FF0000")
        XCTAssertNotNil(redColor)
        
        let blueColor = Color(hex: "#0000FF")
        XCTAssertNotNil(blueColor)
        
        let invalidColor = Color(hex: "invalid")
        XCTAssertNil(invalidColor)
    }
    
    func testSampleHabitsData() throws {
        XCTAssertFalse(SampleHabits.habits.isEmpty)
        XCTAssertEqual(SampleHabits.habits.count, 3)
        
        let firstHabit = SampleHabits.habits.first
        XCTAssertNotNil(firstHabit)
        XCTAssertEqual(firstHabit?.title, "Su İç")
        XCTAssertEqual(firstHabit?.emoji, "💧")
        XCTAssertEqual(firstHabit?.color, .blue)
    }
    
    func testHabitIdentifiable() throws {
        let habit1 = Habit(
            title: "Habit 1",
            emoji: "🌟",
            color: .blue,
            scheduledDays: ["Pazartesi"]
        )
        
        let habit2 = Habit(
            title: "Habit 2",
            emoji: "⭐",
            color: .green,
            scheduledDays: ["Salı"]
        )
        
        XCTAssertNotEqual(habit1.id, habit2.id)
    }
} 