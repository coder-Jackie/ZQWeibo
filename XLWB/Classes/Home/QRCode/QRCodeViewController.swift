//
//  QRCodeViewController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/9/6.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController,UITabBarDelegate {
    /// 扫描容器View
    @IBOutlet weak var containerView: UIView!
    /// 扫描容器高度约束
    @IBOutlet weak var containerHeigthCons: NSLayoutConstraint!
    /// 冲击波视图
    @IBOutlet weak var scanLineView: UIImageView!
    /// 冲击波顶部视图约束
    @IBOutlet weak var scanLineTopCons: NSLayoutConstraint!
    
    /// 底部tabbar
    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.selectedItem = tabBar.items![0]
        tabBar.delegate = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    private func startAnimation() {
        self.scanLineTopCons.constant = -self.containerHeigthCons.constant
        self.containerView.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.scanLineTopCons.constant = self.containerHeigthCons.constant
            self.containerView.layoutIfNeeded()
        }
    }
    

    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            print("二维码")
            
            self.containerHeigthCons.constant = 300
        } else {
            print("条形码")
            self.containerHeigthCons.constant = 150
        }
        
        self.containerView.layer.removeAllAnimations()
        
        startAnimation()
        
    }
    
}
