//
//  SmallVideoCell.swift
//  Today
//
//  Created by hywin on 2018/9/10.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class SmallVideoCell: UICollectionViewCell {
    
    
    private let bottomView       = UIView()

    
    private let avatarButton       = UIButton()
    
    private let vImageView       = UIImageView()
    
    private let nameButton       = UIButton()
    private let concernButton       = UIButton()

    private let titleLabel       = UILabel()
    private let scrollLabel       = UILabel()
    open let bgImageView       = UIImageView()

    var smallVideo = NewsModel() {
        didSet {
            bgImageView.image = nil
            nameButton.setTitle(smallVideo.raw_data.user.info.name, for: .normal)
            avatarButton.kf.setImage(with: URL(string: smallVideo.raw_data.user.info.avatar_url), for: .normal)
            vImageView.isHidden = !smallVideo.raw_data.user.info.user_verified
            concernButton.isSelected = smallVideo.raw_data.user.relation.is_following
            titleLabel.attributedText = smallVideo.raw_data.attrbutedText
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(bottomView)
        bottomView.addSubview(titleLabel)
        bottomView.addSubview(avatarButton)
        
        bottomView.addSubview(nameButton)
        bottomView.addSubview(concernButton)




    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImageView.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            mk.top.equalTo(self.contentView.snp.top).offset(0)

        }
        
        bottomView.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            mk.height.equalTo(55)
        }
        
        titleLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(bottomView.snp.left).offset(15)
            mk.right.equalTo(bottomView.snp.right).offset(-15)
            mk.bottom.equalTo(bottomView.snp.bottom).offset(-10)
            
            
        }
        
        avatarButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(titleLabel.snp.left).offset(0)
            mk.top.equalTo(bottomView.snp.top).offset(0)
            mk.height.equalTo(30)
            mk.width.equalTo(30)

        }
        
        nameButton.titleLabel?.textColor = UIColor.white
        nameButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nameButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(avatarButton.snp.right).offset(0)
            mk.centerY.equalTo(avatarButton.snp.centerY).offset(0)
            mk.height.equalTo(30)
        }
        
        
        concernButton.titleLabel?.textColor = UIColor.white
        concernButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        concernButton.setTitle("关注", for: .normal)
        concernButton.backgroundColor = UIColor(hex: "E6645F")
        concernButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(nameButton.snp.right).offset(5)
            mk.centerY.equalTo(avatarButton.snp.centerY).offset(0)
            mk.height.equalTo(28)
            mk.width.equalTo(72)
            
        }
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
