//
//  ContentView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
  var body: some View {
    VStack {
      Text("MAIN VIEW")
      Button("Sign Out") {
        Task {
          try authenticationViewModel.signOut()
        }
      }
    }
  }
}

#Preview {
  MainView()
}
