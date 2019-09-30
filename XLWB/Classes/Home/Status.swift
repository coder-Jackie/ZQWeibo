//
//  Status.swift
//  XLWB
//
//  Created by CoderZQ on 2019/9/27.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

class Status: NSObject{
    
    var created_at: String?
    var id: Int = 0
    var text: String?
    var source: String?
    var pic_urls:[[String: Any]]?
    
    
    class func loadStatuses() {
        
    }
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
//    var description: String { get }
    
}
