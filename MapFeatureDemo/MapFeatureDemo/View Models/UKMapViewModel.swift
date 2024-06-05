//
//  INDMapViewModel.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-04.
//

import Foundation


class UKMapViewModel: MapViewModelProtocol {
    
    private let mapService: USMapService

    init(mapService: USMapService) {
        self.mapService = mapService
    }

    func setupMap() {
        mapService.initializeMap()
    }
    
}
