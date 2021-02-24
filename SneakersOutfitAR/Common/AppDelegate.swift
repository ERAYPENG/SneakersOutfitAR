//
//  AppDelegate.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            let vc = LogInViewController()
        vc.view.backgroundColor = .systemGroupedBackground
            window!.rootViewController = vc
            window!.makeKeyAndVisible()
            return true
    }

}

