//
//  HomeTableViewController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/8/28.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.如果没有登录,就设置未登录界面的信息
        if !userLogin
        {
            visitorView?.setupVisitorInfo(isHome: true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return
        }
        
        
        // 2.初始化导航条
        setupNav()
        
    }
    
    
    private func setupNav()
    {
        // 左边按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(leftBtnclick))
        // 右边按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(rightBtnclick))
        
        
        // 初始化标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("Z了个Q ", for: UIControl.State.normal)
        titleBtn.addTarget(self, action: #selector(titleBtnBtnclick(btn:)), for: UIControl.Event.touchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    @objc func titleBtnBtnclick(btn:TitleButton) {
        btn.isSelected = !btn.isSelected
    }
    
    @objc func leftBtnclick() {
        print(#function)
    }
    
    @objc func rightBtnclick() {
        print(#function)
    }
    
}
