//
//  DongtaiCollectionViewCell.swift
//  Today
//
//  Created by hywin on 2018/8/29.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class DongtaiCollectionViewCell: UICollectionViewCell {
    private let thumbImageView       = UIImageView()
    var thumbImage = ThumbImage() {
        didSet {
            thumbImageView.kf.setImage(with: URL(string: thumbImage.urlString)!)
//            gifLabel.isHidden = !(thumbImage.type == .gif)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(thumbImageView)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbImageView.snp.makeConstraints { (mk) in
            mk.top.equalTo(self.contentView.snp.top).offset(0)
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            
        }
    
    
    }
    
    
}
