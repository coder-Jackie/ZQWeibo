//
//  MessageTableViewController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/8/28.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class MessageTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.如果没有登录,就设置未登录界面的信息
        if !userLogin
        {
            visitorView?.setupVisitorInfo(isHome: false, imageName: "visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
        }
    }

    

}
