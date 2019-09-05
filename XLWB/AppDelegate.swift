//
//  AppDelegate.swift
//  XLWB
//
//  Created by CoderZQ on 2019/8/28.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 设置导航条和工具条的外观
        UINavigationBar.appearance().tintColor = UIColor.orange
        UITabBar.appearance().tintColor = UIColor.orange
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        window?.rootViewController = MainViewController()
        
        window?.makeKeyAndVisible()
        
        
        return true
    }

    


}

