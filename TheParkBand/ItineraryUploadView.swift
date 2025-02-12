//
//  ItineraryUploadView.swift
//  TheParkBand
//

//  Created by Jim Lambert on 2/11/25.
//

import SwiftUI

struct ItineraryUploadView: View {
  @State var eventType: Itinerary.EventType = .general
  @State var eventAddress: Address?
  @State var eventDate: Int? = 6
  @State private var isPresenting: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 22) {
        WeekComponentView(eventDate: $eventDate)
        HorizonalTabView(eventType: $eventType)
        AddressComponentView(eventAddress: $eventAddress, isPresenting: $isPresenting)
      }.navigationTitle("Add Event")
    }
  }
}

// PREVIEW ITINERARY UPLOAD VIEW
struct ItineraryUploadView_Preview: PreviewProvider {
  static var previews: some View {
    ItineraryUploadView()
  }
}
