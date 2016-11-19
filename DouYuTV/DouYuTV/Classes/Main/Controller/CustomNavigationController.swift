//
//  CustomNavigationController.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/19.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //隐藏push控制器的tabBar
        viewController.hidesBottomBarWhenPushed = true
        
        
        super.pushViewController(viewController, animated: animated)
    }

}
