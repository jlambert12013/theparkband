//
//  UserView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import SwiftUI
import FirebaseAuth

struct UserView: View {
  @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
//  @EnvironmentObject var locationManager: LocationManager
//  @StateObject var userViewModel = UserViewModel()
  
  var body: some View {
    ZStack {
      if let user = authenticationViewModel.user {
        ContentView()
      } else {
        ProgressView()
      }
    }
//    .onAppear {
//      if let authenticatedUser = authenticationViewModel.user {
//        userViewModel.load(user: authenticatedUser)
//      }
//    }
  }
}
