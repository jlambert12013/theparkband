// File: LocationManager.swift Project: LocationAndPlaceLookup
// Created by: Prof. John Gallaugher on 11/27/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import Foundation
import MapKit

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
  var location: CLLocation?
  private let locationManager = CLLocationManager()
  var authorizationStatus: CLAuthorizationStatus = .notDetermined
  var errorMessage: String?
  var locationUpdated: ((CLLocation) -> Void)?
  
  override init() {
    super.init()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  // Get a region around current location with specified radius in meters
  func getRegionAroundCurrentLocation(radiusInMeters: CLLocationDistance = 10000) -> MKCoordinateRegion? {
    guard let location = location else { return nil }
    
    return MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: radiusInMeters,
      longitudinalMeters: radiusInMeters
    )
  }
}

extension LocationManager {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let newLocation = locations.last else { return } // Use the last location as the location
    location = newLocation
    // Call the callback function to indicate we've updated a location
    locationUpdated?(newLocation)
    
    // You can uncomment this when you only want to get the location once, not repeatedly
    manager.stopUpdatingLocation()
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    authorizationStatus = manager.authorizationStatus
    switch manager.authorizationStatus {
      case .authorizedWhenInUse, .authorizedAlways:
        print("LOCATION STATUS: AUTHORIZATION GRANTED.")
        manager.startUpdatingLocation()
      case .denied, .restricted:
        print("LOCATION STATUS: AUTHORIZATION DENIED.")
        errorMessage = "LOCATION STATUS: ACCESS DENIED."
        manager.stopUpdatingLocation()
      case .notDetermined:
        print("LOCATION STATUS: AUTHORIZATION HAS NOT BEEN DETERMINED.")
        manager.requestWhenInUseAuthorization()
      @unknown default:
        print("CHECK OUT NEW ENUMS IN FUTURE UPDATES BY CHECKING OUT CLLocationManager.authorizationStatus IN APPLES DOCUMENTATION.")
        manager.requestWhenInUseAuthorization()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
    errorMessage = error.localizedDescription
    print("LOCATION MANAGER ERROR: \(errorMessage?.description.uppercased() ?? "N/A").")
  }
}
