//
//  LoginScreen.swift
//  Mocking
//
//  Created by Mohammad Azam on 7/2/21.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @StateObject var loginVM: LoginViewModel
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $username)
                    .accessibility(identifier: "usernameTextField")
                TextField("Password", text: $password)
                    .accessibility(identifier: "passwordTextField")
                HStack {
                    Spacer()
                    Button("Login") {
                       // perform login
                        loginVM.login(username, password)
                    }.accessibility(identifier: "loginButton")
                    Spacer()
                }
                
                if loginVM.isAuthenticated {
                    Image(systemName: "lock")
                        .accessibility(identifier: "imageLock")
                }
                
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        return LoginScreen(loginVM: LoginViewModel(service: PetAdoptionService()))
    }
}
