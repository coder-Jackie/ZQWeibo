//
//  TitleButton.swift
//  XLWB
//
//  Created by CoderZQ on 2019/9/5.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage.init(named: "navigationbar_arrow_down"), for: UIControl.State.normal)
        setImage(UIImage.init(named: "navigationbar_arrow_up"), for: UIControl.State.selected)
        setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }

}
