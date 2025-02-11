//
//  SettingsView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/11/25.
//

import SwiftUI
import LoremSwiftum

struct SettingsView: View {
  @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
  let user: User
  
  var body: some View {
    NavigationStack {
      List {
        Section(header: Text("Account")) {
          HStack {
            
            // AVATAR
            UserImage(url: user.photoURL, size: 45)
            VStack(alignment: .leading) {
              
              // NAME AND EMAIL
              VStack(alignment: .leading) {
                Text(user.displayName)
                  .fontWeight(.bold)
                  .padding(.leading)
                Text(user.email)
                  .font(.subheadline)
                  .padding(.leading)
                  .opacity(0.6)
              }
            }
          }
        }
        
        // MARK: USERS
        //        Section(header: Text("Members")) {
        //          //          ForEach(userViewModel.users, id: \.uid) { user in
        //          //            UserRow(user: user, isCurrentUser: false)
        //          //          }
        //        }
        
        // MARK: OPTIONS
        Section(header: Text("Options")) {
          Button("Sign Out") {
            Task {
              try authenticationViewModel.signOut()
            }
          }.foregroundColor(.red)
        }
      }
      .navigationTitle("Settings")
        .listStyle(.insetGrouped)
    }
  }
}


#Preview {
  SettingsView(user: User(
    uid: "1234",
    displayName: Lorem.firstName,
    email: Lorem.emailAddress,
    phoneNumber: "334-372-7120",
    photoURL: URL(string: "https://picsum.photos/id/1/200"),
    isAdmin: false,
    createdOn: Date()))
}

struct UserImage: View {
  let url: URL?
  let size: CGFloat
  
  var body: some View {
    VStack {
      AsyncImage(url: url) { userImage in
        userImage
          .resizable()
          .scaledToFill()
          .clipShape(Circle())
          .frame(width: size, height: size)
      } placeholder: {
        ProgressView()
          .scaledToFill()
          .clipShape(Circle())
          .frame(width: size, height: size)
      }
      .clipShape(Circle())
      .overlay {
        Circle()
          .stroke(.white, lineWidth: 0.2)
          .frame(width: size, height: size)
      }
      .shadow(radius: 1)
    }
  }
}

