//
//  ContentView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
  @State private var selectedTab: Tab = Tab.location
  
  init() {
    UITabBar.appearance().isHidden = true
  }
  
  var body: some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $selectedTab) {
        Text("HOME")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.red.opacity(0.5))
          .tag(Tab.home)
        
        Text("EXPLORE")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.yellow.opacity(0.5))
          .tag(Tab.calendar)
        
        Text("BOOKMARK")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.green.opacity(0.5))
          .tag(Tab.location)
        
        Text("NOTIFICATION")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.green.opacity(0.5))
          .tag(Tab.chat)
        
        Text("PROFILE")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.green.opacity(0.5))
          .tag(Tab.gear)
      }
      CustomBottomTabBarView(currentTab: $selectedTab)
        .padding(.bottom)
    }
  }
  //  var body: some View {
  //    VStack  {
  //      Text("MAIN VIEW")
  //      Button("Sign Out") {
  //        Task {
  //          try authenticationViewModel.signOut()
  //        }
  //      }
  //    }
  //  }
}

#Preview {
  HomeView()
}


