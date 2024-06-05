//
//  LoginService.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-03.
//


import Foundation

enum AuthenticationError: Error {
    case urlError
    case invalidCredentials
    case serverError(statusCode: Int)
}


protocol NetworkService {
    
    func authenticate(username: String, password: String) async throws -> Bool
}


class LoginService: NetworkService {
    // Simulated user credentials
    private let validUsername = "admin"
    private let validPassword = "12345"
    
    
    func authenticate(username: String, password: String) async throws -> Bool {
          // Simulate a delay to mimic network request
           try await Task.sleep(nanoseconds: 1 * 1_000_000_000) // Sleep for 1 second
          
          if username == validUsername && password == validPassword {
              return true
          } else {
              throw AuthenticationError.invalidCredentials
          }
      }

    
    
}

