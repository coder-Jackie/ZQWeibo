//
//  UIBarButtonItem+Category.swift
//  XLWB
//
//  Created by CoderZQ on 2019/9/5.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    // func 加上class 就是OC中的+
    class func creatBarButtonItem(imageName:String, target:AnyObject, action:Selector) ->UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage.init(named: imageName), for: UIControl.State.normal)
        btn.setImage(UIImage.init(named: imageName + "_highlighted"), for: UIControl.State.highlighted)
        btn.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        return UIBarButtonItem.init(customView: btn)
    }
    
}
