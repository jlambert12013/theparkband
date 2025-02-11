//
//  ItineraryUploadView.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/11/25.
//

import SwiftUI

struct ItineraryUploadView: View {
  
  @State var eventType: Itinerary.EventType = .general
  var body: some View {
    NavigationStack {
      VStack(spacing: 22) {
        WeekComponentView()
        HorizonalTabView(selected: $eventType)
          .padding(.bottom)
        Spacer()
        VStack(alignment: .leading) {
          Button {
            
          } label: {
            Label("Add Location", systemImage:"location.circle.fill" )
              .padding(.horizontal, 12)
              .padding(.vertical, 8)
              .background(Color.tabBackground)
              .foregroundStyle(Color.tabFont)
              .cornerRadius(6)
          }
        }
        .padding(.horizontal)
        .navigationTitle("Add Event")
        
      }
    }
  }
}

#Preview {
  ItineraryUploadView()
}
