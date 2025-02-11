//
//  WeeklyCalendarView.swift
//  parkband
//

//  Created by Jim Lambert on 10/26/24.
//

import SwiftUI

struct WeekComponentView: View {
  @State private var weekComponent = WeekComponent(date: .now, range: 0...6)
  @State private var selected: Int?
  
  var body: some View {
    HStack(spacing: 0) {
      Spacer()
      
      if let weekdays = weekComponent.weekdays {
        ForEach(weekdays) { weekday in
          VStack(spacing: 10) {
            Text("\(weekday.date.formatted(.dateTime.weekday(.abbreviated)))")
              .font(.custom("Roboto-Medium", size: 14))
              .opacity(0.6)
              .frame(maxWidth: .infinity, alignment: .centerFirstTextBaseline)
            Button {
              self.selected = weekday.id
            } label: {
              Text("\(weekday.date.formatted(.dateTime.day(.defaultDigits)))")
                .font(.custom("Roboto-Medium", size: 14))
                .padding(14)
                .opacity(selected == weekday.id ? 1.0 : 0.9)
                .background(Circle().fill(selected == weekday.id ? Color("TabBackgroundSelectedColor") : Color.clear))
                .foregroundStyle(selected == weekday.id ? Color("TabFontSelectedColor") : Color("TabFontColor"))
            }.sensoryFeedback(.impact(weight: .light, intensity: 1.0), trigger: selected)
          }.frame(maxWidth: .infinity)
        }
      }
      Spacer()
    }
  }
}

// MARK: PREVIEW WEEK COMPONENT VIEW
struct WeeklyCalendarView_Preview: PreviewProvider {
  static var previews: some View {
    WeekComponentView().previewLayout(.sizeThatFits)
  }
}
