//
//  SmallVideoLayout.swift
//  Today
//
//  Created by hywin on 2018/9/10.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class SmallVideoLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: collectionView!.width, height: collectionView!.height)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
    }
}
