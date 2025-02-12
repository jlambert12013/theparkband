//
//  LocationComponent.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/12/25.
//

import SwiftUI

struct AddressSearchComponent: View {
  @State var locationManager = LocationManager()
  @Binding var selectedPlace: Place?
  @Binding private var sheetIsPresented: Bool
  
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text(selectedPlace?.name ?? "n/a")
          .font(.title2)
        Text(selectedPlace?.address ?? "n/a")
          .font(.title3)
          .foregroundStyle(.secondary)
        Text("\(selectedPlace?.latitude ?? 0.0),\(selectedPlace?.longitude ?? 0.0)")
          .font(.title3)
          .foregroundStyle(.secondary)
      }
      
      Spacer()
      
      Button {
        sheetIsPresented.toggle()
      } label: {
        Image(systemName: "location.magnifyingglass")
        Text("Location Search")
      }
      .buttonStyle(.borderedProminent)
      .font(.title2)
      
    }
    .padding()
    .task {
      // Get user location once when the view appears
      // Handle case if user already authorized location use
      if let location = locationManager.location {
        selectedPlace = await Place(location: location)
      }
      
      // Setup a location callback - this handles when new locations come in after the app launches - it will catch the first locationUpdate, which is what we need, otherwise we won't see the information in the VStack update after the user first authorizes location use.
      locationManager.locationUpdated = { location in // <- not an async task
                                                      // We know we now have a new location, so use it to update the selectedPlace
        Task { // <- So we make it one with Task
          selectedPlace = await Place(location: location)
        }
      }
    }
    .sheet(isPresented: $sheetIsPresented) {
      PlaceLookupView(locationManager: locationManager, selectedPlace: $selectedPlace)
    }
  }
}
