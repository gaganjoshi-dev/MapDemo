//
//  USMapView.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-04.
//

import SwiftUI

import MapKit






struct USMapView: View {
   
    let viewModel: USMapViewModel
    
    init(viewModel: USMapViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var selectedMapOption: MapOptions = .standard
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Map {
                    Marker("Jaggi", coordinate: .jaggi)
                    Annotation("Sahni", coordinate: .sahni) {
                        Image(systemName: "cup.and.saucer.fill")
                            .padding(4)
                            .foregroundColor(.white)
                            .background(.indigo)
                    }
                    
                    UserAnnotation()
                }.mapStyle(.standard)
                Picker("Map Stype", selection: $selectedMapOption) {
                    ForEach(MapOptions.allCases) { mapOption in
                        Text(mapOption.rawValue.capitalized).tag(mapOption)
                    }
                }.pickerStyle(.segmented)
                    .background(.white)
                    .padding()
            }
        }.navigationTitle("Map")
    }
}

#Preview {
    USMapView(viewModel: USMapViewModel(mapService: USMapService()))
}
