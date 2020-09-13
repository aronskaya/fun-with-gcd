//
//  AppDelegate.swift
//  Fun with GCD
//
//  Created by aronskaya on 26.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        cleanup()
    }
}

