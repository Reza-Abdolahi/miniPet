//
//  miniPetApp.swift
//  miniPet
//
//  Created by Reza Abdolahi on 29/03/2024.
//

import SwiftUI

@main
struct miniPetApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ARViewContainer()
            }
            .ignoresSafeArea(.all)
        }
    }
}
