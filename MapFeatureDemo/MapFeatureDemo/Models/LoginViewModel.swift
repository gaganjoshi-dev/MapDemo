//
//  LoginViewModel.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-03.
//

import Foundation
import SwiftUI

@Observable class LoginViewModel {
    
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
   
    var isLoggedIn: Bool = false
    var errorMessage: String?

    func login(username: String, password: String) async {
        
        guard isValid(username: username, password: password) else {
            isLoggedIn = false
            return
        }
        do {
            let isAuthecated = try await service.authenticate(username: username, password: password)
            isLoggedIn = isAuthecated
        } catch {
            isLoggedIn = false
            errorMessage = error.localizedDescription

        }
        
    }
        
        private func isValid(username: String, password: String) -> Bool {
            guard !username.isEmpty else {
                errorMessage = "Please enter a username."
                return false
            }
            
            guard !password.isEmpty else {
                errorMessage = "Please enter a password."
                return false
            }
            
            errorMessage = nil
            return true
        }
    
}
