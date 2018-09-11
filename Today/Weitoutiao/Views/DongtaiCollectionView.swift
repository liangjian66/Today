//
//  DongtaiCollectionView.swift
//  Today
//
//  Created by hywin on 2018/8/29.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class DongtaiCollectionView: UICollectionView {
    
    /// 是否是动态详情
    var isDongtaiDetail = false
    
    
    var thumbImages = [ThumbImage]() {
        didSet {
            reloadData()
        }
    }
    let DongtaiCollectionViewCellID = "DongtaiCollectionViewCellID"

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super .init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        backgroundColor = .clear

        collectionViewLayout = DongtaiCollectionViewFlowLayout()
        
        self.register(DongtaiCollectionViewCell.self, forCellWithReuseIdentifier: DongtaiCollectionViewCellID)
        isScrollEnabled = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension DongtaiCollectionView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DongtaiCollectionViewCellID, for: indexPath) as! DongtaiCollectionViewCell
        cell.thumbImage = thumbImages[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return isDongtaiDetail ? Calculate.collectionViewCellSize(thumbImages.count) : Calculate.collectionViewCellSize(thumbImages.count)
//        return CGSize(width: image3Width, height: image3Width)
        // 微头条 cell  Size
    }
    
    
    
    
}

class DongtaiCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        minimumLineSpacing = 5
        minimumInteritemSpacing = 5
//        itemSize = CGSize(width: image3Width, height: image3Width)
    }
}
