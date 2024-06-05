//
//  MapView.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-04.
//

import SwiftUI

enum MapType {
    case Google
    case MK
}




struct MapView: View {
    let country: MapType

    init(country: MapType) {
        self.country = country
    }
    
    var body: some View {
        switch country {
        case .Google:
            USMapView(viewModel: USMapViewModel(mapService: USMapService()))
        case .MK:
            USMapView(viewModel: USMapViewModel(mapService: USMapService()))
           // UKMapView(viewModel: UKMapViewModel(mapService: UKMapService()))
       
        }
    }
}
