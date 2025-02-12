//
//  HorizonalTabView.swift
//  parkband
//
//  Created by Jim Lambert on 10/29/24.
//


import SwiftUI

struct HorizonalTabView: View {
  @Binding var eventType: Itinerary.EventType
 
 var body: some View {
  ScrollView(.horizontal, showsIndicators: false) {
   HStack {
    ForEach(Itinerary.EventType.allCases, id: \.self) { type in
     Button(action: { self.eventType = type }, label: {
      Text("\(type)".capitalized)
         .fontWeight(.semibold     )
//       .font(.custom("Roboto-Medium", size: 14))
       .padding(.horizontal, 12)
       .padding(.vertical, 8)
       .background(eventType == type.id ? Color("TabBackgroundSelectedColor") : Color("TabBackgroundColor"))
       .foregroundStyle(eventType == type.id ? Color("TabFontSelectedColor") : Color("TabFontColor"))
       .cornerRadius(6)
     }).sensoryFeedback(.impact(weight: .light, intensity: 1.0), trigger: eventType)
    }
   }
   .padding(.bottom)
   .padding(.horizontal)
   .scrollTargetLayout()
  }.scrollTargetBehavior(.viewAligned)
 }
}

// MARK: PREVIEW ITINERARY UPLOAD
struct HorizonalTabView_Preview: PreviewProvider {
 static var previews: some View {
   HorizonalTabView(eventType: .constant(.birthday))
 }
}

