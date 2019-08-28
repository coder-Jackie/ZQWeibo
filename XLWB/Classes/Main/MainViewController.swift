//
//  MainViewController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/8/28.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.orange
        
        addChildViewController(childController: HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(childController: HomeTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(childController: HomeTableViewController(), title: "广场", imageName: "tabbar_discover")
        addChildViewController(childController: HomeTableViewController(), title: "我的", imageName: "tabbar_profile")
    }
    
    
    
    
    /// 初始化子控制器
    private func addChildViewController(childController:UIViewController,title:String,imageName:String)  {
        
        childController.tabBarItem.image = UIImage.init(named: imageName)
        childController.tabBarItem.selectedImage = UIImage.init(named: imageName + "_highlighted")
        childController.tabBarItem.title = title
        childController.title = title
        let nav = UINavigationController()
        nav.addChild(childController)
        addChild(nav)
    }
    

    

}
