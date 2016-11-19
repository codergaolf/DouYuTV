//
//  FunnyViewModel.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/19.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class FunnyViewModel : BaseViewModel{
    // MARK:- 懒加载
}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback : @escaping () -> ()) {
        // http://capi.douyucdn.cn/api/v1/getColumnRoom/3?limit=30&offset=0
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : "30", "offset" : 0], finishedCallback: finishedCallback)
    }
}
