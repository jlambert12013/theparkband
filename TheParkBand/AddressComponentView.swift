//
//  LocationComponent.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/12/25.
//

import SwiftUI
import MapKit

struct AddressComponentView: View {
    @State var locationManager = LocationManager()
    @Binding var eventAddress: Address?
    @Binding var isPresenting: Bool
    @State var text: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(eventAddress?.name ?? "n/a")
                    .font(.title2)
                Text(eventAddress?.address ?? "n/a")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                Text("\(eventAddress?.latitude ?? 0.0),\(eventAddress?.longitude ?? 0.0)")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            
         

            VStack {
                HStack {
                    Image(systemName: "location.circle.fill").resizable()
                    Text("Add Location")
                    Spacer()
                }.padding()
//                .padding(.horizontal, 12)
//                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(Color.gray.tertiary, in:.capsule)
                .clipped()
            }
            .onTapGesture {
                isPresenting.toggle()
            }.padding()
        }
        .task {
            locationManager.locationUpdated = { location in
                Task { eventAddress = await Address(location: location) }
            }
        }.sheet(isPresented: $isPresenting) {
            AddressLookupView(locationManager: locationManager, eventAddress: $eventAddress)
        }
    }
}

#Preview {
    AddressComponentView(locationManager: LocationManager(),
                         eventAddress: .constant(Address(mapItem: MKMapItem())),
                         isPresenting: .constant(false))
}
