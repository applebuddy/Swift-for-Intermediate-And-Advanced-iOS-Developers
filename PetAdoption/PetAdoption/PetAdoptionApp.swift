//
//  PetAdoptionApp.swift
//  PetAdoption
//
//  Created by Mohammad Azam on 7/3/21.
//

import SwiftUI

@main
struct PetAdoptionApp: App {
    var body: some Scene {
        WindowGroup {
            let webserviceFactory = WebserviceFactory()
            LoginScreen(loginVM: LoginViewModel(service: webserviceFactory.create()))
        }
    }
}
