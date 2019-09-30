//
//  PopoverPresentationController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/9/6.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = CGRect.init(x: 100, y: 56, width: 200, height: 200)
    }
}
