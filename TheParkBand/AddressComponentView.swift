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
            Text(eventAddress?.name ?? "n/a").font(.title2)
            Text(eventAddress?.address ?? "n/a").font(.title3).foregroundStyle(.secondary)
            Text("\(eventAddress?.latitude ?? 0.0),\(eventAddress?.longitude ?? 0.0)").font(.title3)
            InputTextFieldView(text: $text,
                               placeholder: "Add Location",
                               keyboardType: .default,
                               systemImage: "location").disabled(true)
                .overlay {
                    Rectangle().onTapGesture {
                        isPresenting = true
                    }.opacity(0.0)
                }
            
                .onTapGesture { isPresenting.toggle() }.padding()
        }.task {
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




struct InputTextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let systemImage: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        
        VStack {
            TextField(placeholder, text: $text)
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                .padding(.leading, systemImage == nil ? textFieldLeading / 2 : textFieldLeading)
                .keyboardType(keyboardType)
                .background(
                    ZStack(alignment: .leading) {
                        if let systemImage = systemImage {
                            Image(systemName: systemImage)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    }
                )
        }
    }
}
