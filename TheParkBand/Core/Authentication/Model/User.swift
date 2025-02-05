//
//  User.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import FirebaseAuth
import FirebaseFirestore


struct User: Codable, Identifiable {
  @DocumentID var id: String?
  let uid: String
  let displayName: String
  let email: String
  let phoneNumber: String
  var photoURL: URL?
  let isAdmin: Bool
  let createdOn: Date

  enum CodingKeys: CodingKey {
    case id
    case uid
    case displayName
    case email
    case phoneNumber
    case photoURL
    case isAdmin
    case createdOn
  }

  init(authenticatedUser currentFirebaseUser: FirebaseAuth.User) {
    self.uid = currentFirebaseUser.uid
    self.displayName = currentFirebaseUser.displayName ?? ""
    self.email = currentFirebaseUser.email ?? ""
    self.phoneNumber = currentFirebaseUser.phoneNumber ?? ""
    self.photoURL = currentFirebaseUser.photoURL ?? nil
    self.isAdmin = false
    self.createdOn = Date()
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self._id, forKey: .id)
    try container.encode(self.uid, forKey: .uid)
    try container.encode(self.displayName, forKey: .displayName)
    try container.encode(self.email, forKey: .email)
    try container.encode(self.phoneNumber, forKey: .phoneNumber)
    try container.encodeIfPresent(self.photoURL, forKey: .photoURL)
    try container.encode(self.isAdmin, forKey: .isAdmin)
    try container.encode(self.createdOn, forKey: .createdOn)
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self._id = try container.decode(DocumentID<String>.self, forKey: .id)
    self.uid = try container.decode(String.self, forKey: .uid)
    self.displayName = try container.decode(String.self, forKey: .displayName)
    self.email = try container.decode(String.self, forKey: .email)
    self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
    self.photoURL = try container.decodeIfPresent(URL.self, forKey: .photoURL)
    self.isAdmin = try container.decode(Bool.self, forKey: .isAdmin)
    self.createdOn = try container.decode(Date.self, forKey: .createdOn)
  }

  init(id: String? = nil, uid: String, displayName: String, email: String, phoneNumber: String, photoURL: URL? = nil, isAdmin: Bool, createdOn: Date) {
    self.id = id
    self.uid = uid
    self.displayName = displayName
    self.email = email
    self.phoneNumber = phoneNumber
    self.photoURL = photoURL
    self.isAdmin = isAdmin
    self.createdOn = createdOn
  }
}

// MARK: DATA FOR PREVIEWS
//extension User {
//  static let mockUser =
//  User(uid: "1234",
//       displayName: "Shawn Michaels", email: "smichaels@wwe.com",
//       phoneNumber: "334-566-1000",
//       photoURL: URL(string: "https://picsum.photos/200"),
//       isAdmin: false,
//       createdOn: Date())
//
//  static let mockUsers: [User] = [
//    User(uid: "1",
//         displayName: "Roman Reigns", email: "romanreigns@wwe.com",
//         phoneNumber: "334-566-2000",
//         photoURL:  URL(string: "https://picsum.photos/200"),
//         isAdmin: false,
//         createdOn: Date()),
//    User(uid: "2",
//         displayName: "Ric Flair", email: "ricflair@gmail.com",
//         phoneNumber: "334-566-3000",
//         photoURL: URL(string: "https://picsum.photos/200"),
//         isAdmin: false,
//         createdOn: Date()),
//    User(uid: "3",
//         displayName: "Steve Autsin", email: "stonecold@yahoo.com",
//         phoneNumber: "334-316-1000",
//         photoURL: URL(string: "https://picsum.photos/200"),
//         isAdmin: false,
//         createdOn: Date()),
//    User(uid: "4",
//         displayName: "Hulk Hogan", email: "hulkhogan@wwe.com",
//         phoneNumber: "334-566-6000",
//         photoURL: URL(string: "https://picsum.photos/200"),
//         isAdmin: false,
//         createdOn: Date()),
//    User(uid: "5",
//         displayName: "Seth Rollins", email: "sethrollins@gmail.com",
//         phoneNumber: "334-268-9500",
//         photoURL: URL(string: "https://picsum.photos/200"),
//         isAdmin: false,
//         createdOn: Date())
//  ]
//}
