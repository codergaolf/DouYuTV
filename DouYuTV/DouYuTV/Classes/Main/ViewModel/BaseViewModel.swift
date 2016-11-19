//
//  BaseViewModel.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/19.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class BaseViewModel {
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(isGroupData : Bool, URLString : String, parameters : [String : Any]? = nil, finishedCallback :@escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: URLString,parameters: parameters) { (result) in
            //1,对数据进行处理
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            //2,判断是否是分组数据
            if isGroupData {
                //2.1, 遍历数组中的字典
                for dict in dataArray {
                    self.anchorGroups.append(AnchorGroup(dict: dict))
                }
                
            } else {
                //2.1, 创建组
                let group = AnchorGroup()
                //2.2 遍历dataArray的所有的字典
                for dict in dataArray {
                    group.anchors.append(AnchorModel(dict: dict))
                }
                //2.3 将group添加到anchorGroups里面
                self.anchorGroups.append(group)
            }
            
            //3,完成回调
            finishedCallback()
        }

    }
}


