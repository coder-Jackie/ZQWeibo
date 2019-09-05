//
//  VisitorView.swift
//  XLWB
//
//  Created by CoderZQ on 2019/8/30.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit
import SnapKit

protocol VisitorViewDelegate: NSObjectProtocol {
    // 登录回调
    func loginBtnWillClick()
    // 注册回调
    func registerBtnWillClick()
}

class VisitorView: UIView {
    
    // 定义一个属性保存代理对象
    // 一定要加weak,避免循环引用
    weak var delegate : VisitorViewDelegate?
    
    func setupVisitorInfo(isHome:Bool, imageName:String, message:String) {
        // 如果不是首页,就隐藏转盘
        iconView.isHidden = !isHome
        // 修改中间图标
        homeIcon.image = UIImage.init(named: imageName)
        // 修改文本
        messageLabel.text = message
        
        // 如果是首页就做动画
        if isHome {
            startAnimation()
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        iconView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        homeIcon.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp_bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.equalTo(60)
            make.right.equalTo(-60)
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(messageLabel.snp_bottom).offset(30)
            make.width.equalTo(60)
            make.left.equalTo(messageLabel.snp_left)
        }
        
        registerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(messageLabel.snp_bottom).offset(30)
            make.width.equalTo(60)
            make.right.equalTo(messageLabel.snp_right)
        }
        
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK - 内部控制方法
    
    private func startAnimation() {
        
        let anim = CABasicAnimation.init(keyPath: "transform.rotation")
        anim.toValue = 2 * Double.pi
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        anim.isRemovedOnCompletion = false
        iconView.layer.add(anim, forKey: nil)
    }
    
    
    
    // MARK - 懒加载控件
    
    /// 转盘
    private lazy var iconView:UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    
    /// 图标
    private lazy var homeIcon: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    
    /// 文本
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "你暂时还没登录,请先登录吧"
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    /// 登录按钮
    lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        btn.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(loginBtnClick), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    /// 注册按钮
    lazy var registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        btn.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(registerBtnClick), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    
    // 登录按钮点击
    @objc func loginBtnClick() {
        print("---loginBtnClick---")
        delegate?.loginBtnWillClick()
        
    }
    
    // 注册按钮点击
    @objc func registerBtnClick() {
        print("---registerBtnClick---")
        delegate?.registerBtnWillClick()
    }
    
    
}
