//
//  Itinerary.swift
//  parkband
//
//  Created by Jim Lambert on 10/6/23.
//

import SwiftUI
import FirebaseFirestore


struct Itinerary: Codable, Identifiable {
  @DocumentID var id: String?
  var createOn = Date.now
  var eventType: EventType = .general
  //  var eventTimes: EventTimes
  var eventName: String = ""
  var eventAttire: Attire = .casual
//  var eventLocation: AddressSearchResult = AddressSearchResult(title: "", subtitle: "")
}

extension Itinerary {
  enum EventType: String, Identifiable, Codable, CaseIterable {
    var id: Self { self }
    case general = "General"
    case wedding = "Wedding"
    case greek
    case corporate
    case city
    case birthday
  }
}

extension Itinerary {
  enum Attire: String, Identifiable, Codable, CaseIterable {
    var id: Self { self }
    case casual = "Casual"
    case formal = "Formal"
    case suit = "Suit"
  }
}

extension Itinerary {
  struct EventTimes: Codable {
    var eventDate = Date()
    //    var depatureTime: Date =  Calendar.current.date(bySettingHour: 8, minute: 00, second: 0, of: Date())
    //    var setupTime: Date =  Calendar.current.date(bySettingHour: 8, minute: 00, second: 0, of: Date())!
    //    var startTime: Date =  Calendar.current.date(bySettingHour: 8, minute: 00, second: 0, of: Date())!
    //    var endTime: Date =  Calendar.current.date(bySettingHour: 8, minute: 00, second: 0, of: Date())!
    //    var ceremonyTime: Date =  Calendar.current.date(bySettingHour: 8, minute: 00, second: 0, of: Date())!
    //    var receptionTime: Date =  Calendar.current.date(bySettingHour: 8, minute: 00, second: 0, of: Date())!
  }
}

//enum Reaction: String, Identifiable, CaseIterable {
//    case thumbsup = "Thumbs Up"
//    case thumbsdown = "Thumbs Down"
//    case heart = "Heart"
//    case questionMark = "Question Mark"
//    var id: Self { self }
//}

//extension Itinerary {
//
//  struct TabModel: Identifiable {
//      private(set) var id: Tab
//      var size: CGSize = .zero
//      var minX: CGFloat = .zero
//
//      enum Tab: String, CaseIterable {
//        case general
//        case wedding
//        case greek
//        case corporate
//      }
//  }

//  enum EventCategory: Identifiable, CaseIterable {
//    case general
//    case wedding
//    case greek
//    case corporate
//
//    var categoryString: String {
//      switch self {
//        case .general:
//          return "General"
//        case .wedding:
//          return "Wedding"
//        case .greek:
//          return "Greek"
//        case .corporate:
//          return "Corporate"
//      }
//    }
//  }

//}

//extension Itinerary {
//  static var empty: Itinerary {
//    let defaultTime =  Calendar.current.date(bySettingHour: 8, minute: 00, second: 0, of: Date())!
//    let eventTimes =  EventTimes()
//    let eventType: EventType = .general
//    return Itinerary(eventTimes: eventTimes, eventType: eventType)
//  }
//}

//extension Itinerary {
//  enum EventType: String, Equatable, Codable, CaseIterable, Identifiable {
//    var id: Self { self }
//    case party = "Party"
//    case selection = ""
//    case Bar = "Bar"
//    case Benefit = "Benefit"
//    case College = "College Campus"
//    case ChristmasParty = "Christmas Party"
//    case CorporateEvent = "Corporate Event"
//    case GraduationParty = "Graduation Party"
//    case Greek = "Greek"
//    case MardiGrasBall = "Mardi Gras Ball"
//    case PrivateParty = "Private Party"
//    case Prom = "High School Prom"
//    case PublicEvent = "Public Event"
//    case WeddingReception = "Wedding Reception"
//    case Other = "Other"
//  }
//}


