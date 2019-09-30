//
//  HomeTableViewController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/8/28.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

import AFNetworking
import SVProgressHUD


let reuseIdentifierID = "ReuseIdentifier"


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
        
        
        tableView.register(StatusTableViewCell.self, forCellReuseIdentifier: reuseIdentifierID)
        
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
        
        // 弹出弹窗
        let sb = UIStoryboard.init(name: "PopoverViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        vc?.transitioningDelegate = self
        vc?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        
        present(vc!, animated: true, completion: nil)

    }
    
    @objc func leftBtnclick() {
        print(#function)
    }
    
    @objc func rightBtnclick() {
        print(#function)
    
        let sb = UIStoryboard.init(name: "QRCodeViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        present(vc!, animated: true, completion: nil)
        
    }
    
}


extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierID, for: indexPath) as! StatusTableViewCell
        cell.status = Status(dict: ["text": "你好啊"])
        return cell
        
    }
}
 

extension HomeTableViewController : UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        return PopoverPresentationController.init(presentedViewController: presented, presenting: presenting)
    }
}
