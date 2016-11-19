//
//  AmuseMenuView.swift
//  DouYuTV
//
//  Created by 高立发 on 2016/11/19.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

private let kMenuCellID = "kMenuCellID"

class AmuseMenuView: UIView {
    
    // MARK:- 定义属性
    var groups : [AnchorGroup]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK:- 从xib中加载出来
    override func awakeFromNib() {
        collectionView.register(UINib(nibName: "AmuseMenuViewCell", bundle: nil), forCellWithReuseIdentifier: kMenuCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }

}



extension AmuseMenuView {
    class func amuseMenuView() -> AmuseMenuView {
        return Bundle.main.loadNibNamed("AmuseMenuView", owner: nil, options: nil)?.first as! AmuseMenuView
    }
}


// MARK:- 遵守
extension AmuseMenuView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if  groups == nil { return 0 }
        let pageNum = (groups!.count - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //1,取出cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMenuCellID, for: indexPath) as! AmuseMenuViewCell
        
        //2,给cell设置数据
        setCellDataWithCell(cell: cell, indexpath: indexPath)
        
        return cell
    }
    
    private func setCellDataWithCell(cell : AmuseMenuViewCell, indexpath : IndexPath) {
        // 0页: 0~7
        // 1页: 8~15
        // 2页: 16~23
        //1,取出起始位置和重点位置
        let startIndex = indexpath.item * 8
        var  endIndex = (indexpath.item + 1) * 8 - 1
        
        //2,判断越界问题
        if endIndex > groups!.count - 1 {
            endIndex = groups!.count - 1
        }
        
        //3,取出数据,并且赋值给cell
        cell.groups = Array(groups![startIndex...endIndex])
    }
}

extension AmuseMenuView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int((scrollView.contentOffset.x / scrollView.bounds.width))
    }
}
