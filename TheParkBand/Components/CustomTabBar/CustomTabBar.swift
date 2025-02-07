//
//  CustomTabBar.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/7/25.
//

import SwiftUI

enum Tab: String, Hashable, CaseIterable {
  case home = "list.clipboard"
  case calendar = "calendar"
  case location = "location"
  case chat = "bubble"
  case gear = "gear"
}

private let buttonDimen: CGFloat = 55

struct CustomBottomTabBarView: View {
  @Binding var currentTab: Tab
  
  var body: some View {
    HStack {
      TabBarButton(imageName: Tab.home.rawValue)
        .frame(width: buttonDimen, height: buttonDimen)
        .onTapGesture {
          currentTab = .home
        }
      
      Spacer()
      
      TabBarButton(imageName: Tab.calendar.rawValue)
        .frame(width: buttonDimen, height: buttonDimen)
        .onTapGesture {
          currentTab = .calendar
        }
      
      Spacer()
      
      TabBarButton(imageName: Tab.location.rawValue)
        .frame(width: buttonDimen, height: buttonDimen)
        .onTapGesture {
          currentTab = .location
        }
      
      Spacer()
      
      TabBarButton(imageName: Tab.chat.rawValue)
        .frame(width: buttonDimen, height: buttonDimen)
        .onTapGesture {
          currentTab = .chat
        }
      
      Spacer()
      
      TabBarButton(imageName: Tab.gear.rawValue)
        .frame(width: buttonDimen, height: buttonDimen)
        .onTapGesture {
          currentTab = .gear
        }
      
    }
    .frame(width: (buttonDimen * CGFloat(Tab.allCases.count)) + 60)
    .tint(Color.black)
    .padding(.vertical, 2.5)
    .background(Color.white)
    .clipShape(Capsule(style: .continuous))
    .overlay {
      SelectedTabCircleView(currentTab: $currentTab)
    }
    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 10)
    .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.65), value: currentTab)
  }
}

private struct TabBarButton: View {
  let imageName: String
  var body: some View {
    Image(systemName: imageName)
      .renderingMode(.template)
      .tint(.black)
      .fontWeight(.bold)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CustomBottomTabBarView(currentTab: .constant(.calendar))
  }
}

struct SelectedTabCircleView: View {
  @Binding var currentTab: Tab
  
  private var horizontalOffset: CGFloat {
    switch currentTab {
      case .home:
        return -138
      case .calendar:
        return -72
      case .location:
        return 0
      case .chat:
        return 72
      case .gear:
        return 138
    }
  }
  
  var body: some View {
    ZStack {
      Circle()
        .fill(.primary)
        .frame(width: buttonDimen , height: buttonDimen)
      TabBarButton(imageName: "\(currentTab.rawValue)")
        .foregroundColor(Color.primaryText)
    }.offset(x: horizontalOffset)
  }
}
