//
//  InvioFilmApp.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import SwiftUI

@main
struct InvioFilmApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
