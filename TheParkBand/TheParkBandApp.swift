//
//  TheParkBandApp.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TheParkBandApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @StateObject var authenticationViewModel = AuthenticationViewModel()
  
  var body: some Scene {
    WindowGroup {
      AuthenticationView()
        .environmentObject(authenticationViewModel)
        .onAppear {
          authenticationViewModel.restoreSession()
        }
    }
  }
}

