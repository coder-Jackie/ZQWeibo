//
//  BaseTableViewController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/8/30.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,VisitorViewDelegate {
    
    
    
    var userLogin = true
    
    var visitorView:VisitorView?
    
    override func loadView() {
        userLogin ? super.loadView() : setupVisitorView()
    }
    
    func setupVisitorView() {
        
        // 1.初始化未登录界面
        let customView = VisitorView()
        customView.delegate = self
        view = customView
        visitorView = customView
        
        // 2.设置导航条未登录按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "登录", style: UIBarButtonItem.Style.plain, target: self, action: #selector(loginBtnWillClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "注册", style: UIBarButtonItem.Style.plain, target: self, action: #selector(registerBtnWillClick))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @objc func loginBtnWillClick() {
        print(#function)
    }
    
    @objc func registerBtnWillClick() {
        print(#function)
    }

    

}
