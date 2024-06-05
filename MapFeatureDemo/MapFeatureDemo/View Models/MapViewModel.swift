//
//  MapViewModel.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-04.
//

import Foundation

class MapViewModel: ObservableObject {
   
    private let mapService: MapService
    
    init(mapService: MapService) {
        self.mapService = mapService
    }
    
    func setupMap() {
        mapService.initializeMap()
    }
}
