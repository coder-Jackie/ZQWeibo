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

//        tabBar.tintColor = UIColor.orange
        // 添加子控制器
        addChildViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 添加加号按钮
        setupComposeBtn()
    }
    
    
    private func setupComposeBtn() {
        
        tabBar.addSubview(composeBtn)
        // 添加添加按钮
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count)
        let rect = CGRect.init(x: 0, y: 0, width: width, height: tabBar.bounds.height)
        composeBtn.frame = rect.offsetBy(dx: 2 * width, dy: 0)
        
//        tabBar.bringSubviewToFront(composeBtn)
 
    }
    
    private func addChildViewControllers() {
        addChildViewController(childController: HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(childController: MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(childController: NullViewController(), title: "", imageName: "")
        addChildViewController(childController: DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(childController: ProfileTableViewController(), title: "我的", imageName: "tabbar_profile")
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
    
    
    // 加号按钮
    private lazy var composeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: UIControl.State.normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: UIControl.State.highlighted)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControl.State.normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControl.State.highlighted)
        btn.addTarget(self, action: #selector(btnAction), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    
    
    // 这里点击没反应 再解决
    @objc func btnAction() {
        print(#function)
    }
}
