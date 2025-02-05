//
//  ContentView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
  var body: some View {
    VStack {
      Button("Sign Out") {
        Task {
          try authenticationViewModel.signOut()
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
