//
//  SettingsView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/11/25.
//

import SwiftUI

struct SettingsView: View {
  let user: User
  
  var body: some View {
    Text("\(user.email)")
  }
}
