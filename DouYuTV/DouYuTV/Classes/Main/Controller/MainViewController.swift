//
//  MainViewController.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/12.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
        
    }
    
    private func addChildVc(storyName : String) {
        //1,通过storyBoard获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        //2,将childVc作为子控制器
        addChildViewController(childVc)
    }
    

}
