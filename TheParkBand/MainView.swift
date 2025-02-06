//
//  ContentView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import SwiftUI
import FloatingTabBar

struct MainView: View {
  @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
  @State private var selectedIndex: Int = 0
  
  @State var items: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", color: .red),
    BottomBarItem(icon: "magnifyingglass", color: .red),
    BottomBarItem(icon: "heart", color: .red),
    BottomBarItem(icon: "person.fill", color: .red),
  ]

//  let items: [BottomBarItem] = [
//    BottomBarItem(icon: "house", color: Color.red)
//  ]
//
//  var selectedItem: BottomBarItem {
//      items[selectedIndex]
//  }
  var body: some View {
    VStack {
      Text("MAIN VIEW")
      Button("Sign Out") {
        Task {
          try authenticationViewModel.signOut()
        }
      }
      
      BottomBar(selectedIndex: $selectedIndex, items: $items)
   
    }
    
    
  }
}

#Preview {
  MainView()
}
