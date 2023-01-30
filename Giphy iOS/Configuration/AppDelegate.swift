//
//  AppDelegate.swift
//  Giphy
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeAssembly = HomeAssembly.createContainer()
        let controller = homeAssembly.resolve(HomeViewController.self)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
