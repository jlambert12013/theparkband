//
//  AuthenticationView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import SwiftUI

struct AuthenticationView: View {
  @EnvironmentObject var authenticationViewModel: AuthenticationViewModel

  var body: some View {
    switch authenticationViewModel.state {
      case .signedIn:
        ContentView().environmentObject(authenticationViewModel)
      case .signedOut:
        SignInView()
    }
  }
}
