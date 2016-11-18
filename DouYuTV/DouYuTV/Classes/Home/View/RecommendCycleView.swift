
//
//  RecommendCycleView.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/18.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {
    
    // 定义属性
    var cycleModels : [CycleModel]? {
        didSet {
            // 1,刷新collectionView
            collectionView.reloadData()
            
            // 2,设置pageControl的个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
        }
    }

    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    // MARK:- 系统回调函数
    override func awakeFromNib() {
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        
        // 注册cell
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
        
    }
    override func layoutSubviews() {
        
        //设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: kScreenW, height: kScreenW * 3 / 8)
    }
}


// MARK:- 提供一个快速创建View的类方法
extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

// MARK:- 遵守UICollectionViewDatasource方法
extension RecommendCycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cycleModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 1,取出model
        let cycleModel = cycleModels![indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CollectionCycleCell
        cell.cycleModel = cycleModel
        
        return cell
    }
}

// MARK:- 遵守UICollectionViewDelegate
extension RecommendCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1,获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 2,计算pageControl的currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width)
    }
}
