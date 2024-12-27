//
//  CoinTrackerApp.swift
//  CoinTracker
//
//  Created by Hasan Saral on 23.12.2024.
//

import SwiftUI
import Utilities

class AppDelegate: UIResponder, UIApplicationDelegate {
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserManager().save(key:"e42328e0a07699872238807ddaf56b7c3918d4e795f78ff3c6b215759f9bcd42") //Sample
         return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}

@main
struct CoinTrackerApp: App {
    @StateObject var model = ModelSet()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(model)
        }
    }
}
