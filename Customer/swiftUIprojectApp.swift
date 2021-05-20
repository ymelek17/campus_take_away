//
//  swiftUIprojectApp.swift
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI

@main
struct swiftUIprojectApp: App {
    @StateObject private var basketInfo = BasketInfo()

    var body: some Scene {
        WindowGroup {
                WelcomeView().environmentObject(basketInfo)
        }
    }
}

