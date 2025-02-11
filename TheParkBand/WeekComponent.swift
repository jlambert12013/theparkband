//
//  WeekPicker.swift
//  parkband
//
//  Created by Jim Lambert on 10/29/24.
//

import Foundation

struct WeekComponent: Identifiable {
  var id: UUID
  var currentWeek: Int?
  var range: ClosedRange<Int> = 0...6
  var weekdays: [Weekday]?
  
  init(date: Date, range: ClosedRange<Int>) {
    self.id = UUID()
    self.currentWeek = getCurrentWeek(date: date)
    self.weekdays = getCurrentWeekdays(date: date, range: range)
  }
  
  // MARK: WEEKLY COMPONENT METHODS
  func getCurrentWeek(date: Date) -> Int {
    let calendar = Calendar.current
    let dateComponent = calendar.dateComponents(in: .current, from: date)
    guard let weekNumber = dateComponent.weekOfYear else { return 0 }
    return weekNumber
  }
  
  func getCurrentWeekdays(date: Date, range: ClosedRange<Int>) -> [Weekday] {
    let calendar = Calendar.current
    let dateComponent = calendar.dateComponents(in: .current, from: date)
    
    guard let currentWeekday = dateComponent.weekday else { return [] }
    guard let previousSunday = calendar.date(byAdding: .day, value: -currentWeekday + 1, to: .now) else { return [] }
    
    let dates = (range).compactMap {
      calendar.date(byAdding: .day, value: $0, to: previousSunday)
    }
    
    let weekayObject = dates.compactMap { date in
      weekdayObject(date: date)
    }
    
    return weekayObject
  }
  
  func weekdayObject(date: Date) -> Weekday? {
    let calendar = Calendar.current
    let dateComponent = calendar.dateComponents(in: .current, from: date)
    
    guard let weekdayName = dateComponent.day else { return nil }
    guard let weekdayNumber = dateComponent.weekday else { return nil }
    guard let weekdayDate = dateComponent.date else { return nil }
    
    return Weekday(id: weekdayNumber, weekday: weekdayName, date: weekdayDate)
  }
}

struct Weekday: Identifiable {
  let id: Int
  let weekday: Int
  let date: Date
  
  init(id: Int, weekday: Int, date: Date) {
    self.id = id
    self.weekday = weekday
    self.date = date
  }
}
