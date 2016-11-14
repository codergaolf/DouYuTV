//
//  UIBarButtonItem-Extension.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/12.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func creatItem(imgName : String, highLighted : String, size : CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named:imgName), for: .normal)
        btn.setImage(UIImage(named:highLighted), for: .selected)
        
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    */
    
    //便利构造函数 : 1>必须以convenience开头 2>在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imgName : String, highLighted : String = "", size : CGSize = CGSize.zero) {
        
        //1,创建UIButton
        let btn = UIButton()
        
        //2,设置button图片
        btn.setImage(UIImage(named:imgName), for: .normal)
        
        if highLighted != "" {
            btn.setImage(UIImage(named:highLighted), for: .selected)
        }
        
        //3,设置button尺寸
        if size != CGSize.zero {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        } else {
            btn.sizeToFit()
        }
        
        self.init(customView : btn)
    }
}
