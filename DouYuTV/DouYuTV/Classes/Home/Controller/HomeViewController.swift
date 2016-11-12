//
//  HomeViewController.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/12.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI
        setupUI()
        
    }

}

// MARK:- 设置UI界面
extension HomeViewController {
    func setupUI() {
        //设置导航栏
        setupNavigationBar()
        
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
