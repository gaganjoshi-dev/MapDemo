//
//  USMapService.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-04.
//

import Foundation
import MapKit

class USMapService: NSObject, MapService, CLLocationManagerDelegate {
    
    let manager: CLLocationManager = CLLocationManager()
    var region: MKCoordinateRegion = MKCoordinateRegion()

    
    func initializeMap() {
        self.manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
        self.manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
  
}

extension CLLocationCoordinate2D {
    
    static var jaggi: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 30.343699899756317, longitude: 76.37853199095191)
    }
    
    static var sahni: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 30.342986536108796, longitude: 76.37929532419359)
    }
}


enum MapOptions: String, Identifiable, CaseIterable {
    
    case standard
    case hybrid
    case imagery
    
    var id: String {
        self.rawValue
    }
}
