//
//  NSDate-Extension.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/17.
//  Copyright © 2016年 GG. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentDate() -> String {
        let nowDate = NSDate()
        
        let interVal = Int(nowDate.timeIntervalSince1970)
        
        return "\(interVal)"
    }
    
}
