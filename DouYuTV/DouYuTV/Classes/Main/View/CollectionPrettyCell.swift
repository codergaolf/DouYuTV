//
//  CollectionPrettyCell.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/14.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class CollectionPrettyCell: CollectionBaseCell {

    // MARK:- 控件属性
    @IBOutlet weak var cityBtn: UIButton!
    
    //数据属性
    override var anchor : AnchorModel? {
        didSet {
            super.anchor = anchor
            //3,城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
