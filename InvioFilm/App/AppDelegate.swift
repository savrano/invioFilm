//
//  AppDelegate.swift
//  InvioFilm
//
//  Created by Yağız Savran on 30.06.2022.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}
