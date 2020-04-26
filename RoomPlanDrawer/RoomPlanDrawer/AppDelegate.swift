//
//  AppDelegate.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 17.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupGUI()
        return true
    }
}

// MARK: - Private
private extension AppDelegate {
    func setupGUI() {
        window = UIWindow()
        
        let view = ProjectsListAssembly.view(networkManager: NetworkManager())
        let nc = UINavigationController(rootViewController: view)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}

