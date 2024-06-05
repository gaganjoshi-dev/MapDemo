//
//  MapFeatureDemoApp.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-05-31.
//

import SwiftUI

@main
struct MapFeatureDemoApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel(service: LoginService()))
        }
    }
}
