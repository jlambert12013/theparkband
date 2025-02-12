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
        UserView().environmentObject(authenticationViewModel)
      case .signedOut:
        SignInView()
        
    }
  }
}

// PREVIEW AUTHENTICAITON VIEW
struct AuthenticationView_Previews: PreviewProvider {
  static var previews: some View {
    AuthenticationView().environmentObject(AuthenticationViewModel())
  }
}
