//
//  FoodOrderApp.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/26.
//

import SwiftUI
import Firebase

@main
struct FoodOrderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}

// Initializing Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
