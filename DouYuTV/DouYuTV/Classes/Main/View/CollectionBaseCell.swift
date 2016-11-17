//
//  CollectionBaseCell.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/17.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    // MARK:- 定义模型属性
    var anchor : AnchorModel? {
        didSet {
            
            //0,校验模型是否有值
            guard let anchor = anchor else { return }
            var onlineStr = ""
            //1,获取观看人数
            if anchor.online > 10000 {
                onlineStr = "\(anchor.online/10000)万人"
            } else {
                onlineStr = "\(anchor.online)人"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            //2,主播昵称
            nicknameLabel.text = anchor.nickname
            
            //3,设置图片
            guard let iconURL = URL(string : anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: iconURL)
        }
    }
    
    
}
