//
//  HomeViewController.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/12.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width:kScreenW , height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI
        setupUI()
        
    }

}

// MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        //0,不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //1,设置导航栏
        setupNavigationBar()
        
        //2,设置titleView
        view.addSubview(pageTitleView)
        
    }
    
    private func setupNavigationBar() {
        
        //设置左侧item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "logo")
        
        //设置右侧item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imgName: "image_my_history", highLighted: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imgName: "btn_search", highLighted: "btn_search_clicked", size: size)
        let qrCodeItem = UIBarButtonItem(imgName: "Image_scan", highLighted: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrCodeItem]
    }
}