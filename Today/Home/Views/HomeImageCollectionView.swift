//
//  HomeImageCollectionView.swift
//  Today
//
//  Created by hywin on 2018/8/30.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class HomeImageCollectionView: UICollectionView {

    let identifier = "HomeImageCellID"
    var images = [ImageList]() {
        didSet {
            reloadData()
        }
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super .init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        backgroundColor = .clear
        
        collectionViewLayout = DongtaiCollectionViewFlowLayout()
        
        self.register(HomeImageCell.self, forCellWithReuseIdentifier: identifier)
        isScrollEnabled = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeImageCollectionView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HomeImageCell
        cell.image = images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: image3Width, height: image3Width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        didSelect?(indexPath.item)
    }

}
