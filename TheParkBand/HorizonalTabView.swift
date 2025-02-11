//
//  HorizonalTabView.swift
//  parkband
//
//  Created by Jim Lambert on 10/29/24.
//


import SwiftUI

struct HorizonalTabView: View {
  @Binding var selected: Itinerary.EventType
 
 var body: some View {
  ScrollView(.horizontal, showsIndicators: false) {
   HStack {
    ForEach(Itinerary.EventType.allCases, id: \.self) { type in
     Button(action: { self.selected = type }, label: {
      Text("\(type)".capitalized)
//       .font(.custom("Roboto-Medium", size: 14))
       .padding(.horizontal, 12)
       .padding(.vertical, 8)
       .background(selected == type.id ? Color("TabBackgroundSelectedColor") : Color("TabBackgroundColor"))
       .foregroundStyle(selected == type.id ? Color("TabFontSelectedColor") : Color("TabFontColor"))
       .cornerRadius(6)
     }).sensoryFeedback(.impact(weight: .light, intensity: 1.0), trigger: selected)
    }
   }.scrollTargetLayout()
  }.scrollTargetBehavior(.viewAligned)
 }
}

// MARK: PREVIEW ITINERARY UPLOAD
struct HorizonalTabView_Preview: PreviewProvider {
 static var previews: some View {
   HorizonalTabView(selected: .constant(.birthday))
 }
}

