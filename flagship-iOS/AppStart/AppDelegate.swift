//
//  AppDelegate.swift
//  flagship-iOS
//
//  Created by Mina on 11/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var saryCoordinator: SaryCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Language.setAppLanguage(lang: "en")
        window = UIWindow()
        saryCoordinator = SaryCoordinator(window: window)
        saryCoordinator.start()
        return true
    }

}

