//
//  AppDelegate.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = window else {return false}
        
        let navController = UINavigationController()
        let menuController = MenuViewController()
        navController.viewControllers.append(menuController)
        window.rootViewController = navController
        
        window.makeKeyAndVisible()
        
        return true
    }

}

