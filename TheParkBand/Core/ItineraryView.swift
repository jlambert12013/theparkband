//
//  ItineraryView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/11/25.
//

import SwiftUI

struct ItineraryView: View {
  @State var isPresenting: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack {
        Text("Itinerary")
      }
      .fullScreenCover(isPresented: $isPresenting) {
        ItineraryUploadView()
      }
      .navigationTitle("This Week")
      .toolbar {
        Button {
          isPresenting = true
        } label: {
          HStack {
            Text("Add Event")
            Image(systemName: "calendar.badge.plus")
          }
        }
      }
    }
  }
}

#Preview {
  ItineraryView(isPresenting: false)
}
