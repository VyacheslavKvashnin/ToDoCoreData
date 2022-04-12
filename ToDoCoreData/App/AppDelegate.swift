//
//  AppDelegate.swift
//  ToDoCoreData
//
//  Created by Вячеслав Квашнин on 11.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: TasksViewController())
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        StorageManager.shared.saveContext()
    }
}

