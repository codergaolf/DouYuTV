//
//  RecommendViewController.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/14.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90


class RecommendViewController: BaseAnchorViewController {
    
    // MARK:- 懒加载属性
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    fileprivate lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    fileprivate lazy var gameView : RecommendGameView = {
        let gameView  = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()

}

// MARK:- 设置UI界面
extension RecommendViewController {
    
    override func setupUI() {
        //1,下调用super.setupUI()
        super.setupUI()
        
        //2,将cycleView添加到UICollectionView
        collectionView.addSubview(cycleView)
        
        //3,将gameView添加到collectionView中
        collectionView.addSubview(gameView)
        
        //4,设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
            
    }
}

// MARK:- 请求数据
extension RecommendViewController {
    override func loadData() {
        //0,给父类中的viewModel进行赋值
        baseVM = recommendVM
        
        // 1,请求推荐数据
        recommendVM.requestData {
            
            //1, 展示推荐数据
            self.collectionView.reloadData()
            
            //2, 将数据传递给gameView
            var groups = self.recommendVM.anchorGroups
            //2.1,移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            
            //2.2,添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups
        }
        
        // 2,请求无限轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

extension RecommendViewController : UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            //1,取出prettyCell
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            //2,设置数据
            prettyCell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return prettyCell
        } else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }
        
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
}
