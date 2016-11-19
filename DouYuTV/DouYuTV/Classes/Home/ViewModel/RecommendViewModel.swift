//
//  RecommendViewModel.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/17.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 1> 请求0/1数组, 并转成模型对象
 2> 对数据进行排序
 3> 显示的HeaderView中内容
 */

import UIKit

class RecommendViewModel : BaseViewModel {
    
    // MARK:- 懒加载属性
    // 0 1 2-12
    lazy var cycleModels : [CycleModel] = [CycleModel]()
    fileprivate lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup : AnchorGroup = AnchorGroup()
    
}

// MARK:- 发送网络请求
extension RecommendViewModel {
    
    // 请求推荐数据
    func requestData(finishedCallback : @escaping ()->()) {
        
        //1,定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentDate()]
        
        //2,创建Group
        let dGroup = DispatchGroup()
        
        //3,请求第一部分推荐数据
        dGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getbigDataRoom?time=1479370486
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time":NSDate.getCurrentDate()]) { (result) -> () in
            //1,将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            
            //2,根据data该key,获取数组
            guard let dataArray = resultDic["data"] as? [[String : NSObject]] else { return }
            
            //3,遍历字典,并且转成模型对象
            
            //3.1,给组设置属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            //3.2,获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
                
            }
            
            //3.3,离开组
            dGroup.leave()

           
        }
        
        //4,请求第二部分颜值数据
        dGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getVerticalRoom?limit=4&offset=0&time=1479370486
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) -> () in
            //1,将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            
            //2,根据data该key,获取数组
            guard let dataArray = resultDic["data"] as? [[String : NSObject]] else { return }
            
            //3,遍历字典,并且转成模型对象
            
            //3.1,给组设置属性
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            //3.2,获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
                
            }
            
            //3.3, 离开组
            dGroup.leave()
        }
        
        
        //5,请求后面部分游戏数据
        dGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1479370486
        loadAnchorData(URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) {
            dGroup.leave()
        }
        
        
        //6,所有的数据请求到, 之后进行排序
        dGroup.notify(queue: DispatchQueue.main) {

            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            finishedCallback()
        }
    }
    
    // 请求无限轮播的数据
    func requestCycleData(finishCallback : @escaping () -> ()) {
        // http://www.douyutv.com/api/v1/slide/6?version=2.401
        NetworkTools.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.401"]) { (result) -> () in
            
            // 1,获取整体字典数据
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2,根据data的key获取数据
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3,字典转模型对象
            for dict in dataArray {
                self.cycleModels.append(CycleModel(dict: dict))
            }
            
            finishCallback()
            
            
        }
        
    }
}

/*
NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]) { (result) -> () in
    print(result)
}
*/
