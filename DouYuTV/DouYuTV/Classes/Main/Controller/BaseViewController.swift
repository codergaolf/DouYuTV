//
//  BaseViewController.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/19.
//  Copyright © 2016年 GG. All rights reserved.
//
// img_loading_1

import UIKit

class BaseViewController: UIViewController {
    
    // MARK:- 定义属性
    var contentView : UIView?
    
    // MARK:- 懒加载属性
    fileprivate lazy var animImageView : UIImageView = {[unowned self] in
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named : "img_loading_1")!,UIImage(named : "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
    }()
    
    
    // MARK:- 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2,添加执行动画的UIImageView
        setupUI()
        
        
    }

}

extension BaseViewController {
    func  setupUI() {
        
        //1,先隐藏内容view
        contentView?.isHidden = true
        
        //2,添加执行动画的UIImageView
        view.addSubview(animImageView)
        
        //3,给animImageView执行动画
        animImageView.startAnimating()
        
        //4,设置view的背景颜色
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished() {
        //1,停止动画
        animImageView.stopAnimating()
        
        //2,隐藏animImageView
        animImageView.isHidden = true
        
        //3,显示内容的view
        contentView?.isHidden = false
    }
}

