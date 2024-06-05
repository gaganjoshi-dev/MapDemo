//
//  LoginView.swift
//  MapFeatureDemo
//
//  Created by gagan joshi on 2024-06-03.
//

import SwiftUI



struct LoginView: View {
    
    @State var viewModel: LoginViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    private var isLoginDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Username", text: $username)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(4)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(4)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            Task {
                                await viewModel.login(username: username, password: password)
                            }
                        }) {
                            Text("Login")
                                .frame(minWidth: 100)
                                .frame(minHeight: 30)
                                .padding(8)
                                .background(isLoginDisabled ? Color.gray : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(4)
                        }
                        .disabled(isLoginDisabled)
                        Spacer()
                    }
                }.listRowBackground(Color.clear)
            }
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                MapView(country: .US)
            }
            .navigationTitle("Login")
        }
    }
}



#Preview {
    LoginView(viewModel: LoginViewModel(service: LoginService()))
}
