//
//  StatusTableViewCell.swift
//  XLWB
//
//  Created by CoderZQ on 2019/9/29.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var status: Status? {
        didSet{
            textLabel?.text = "随手拍随手拍"
        }
    }
    
    
    // MARK: - 懒加载
    
    ///头像
    lazy var iconView: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "avatar_default_big"))
        return iv
    }()
    

}
