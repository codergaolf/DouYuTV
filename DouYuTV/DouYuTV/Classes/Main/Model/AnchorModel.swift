//
//  AnchorModel.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/17.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    ///房间ID
    var room_id : Int = 0
    ///房间图片对应的URLString
    var vertical_src : String = ""
    ///0: 电脑直播 1:手机直播
    var isVertical : Int = 0
    ///房间名称
    var room_name : String = ""
    ///主播昵称
    var nickname : String = ""
    ///在线人数
    var online : Int = 0
    ///所在城市
    var anchor_city : String = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
