//
//  MyConcernCell.swift
//  Today
//
//  Created by hywin on 2018/8/23.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import Kingfisher
class MyConcernCell: UICollectionViewCell {
    
    private let avatarImageView       = UIImageView()
    private let vipImageView      = UIImageView()
    private let nameLabel     = UILabel()
    private let tipsButton     = UIButton()
    
    
    var myConcern = MyConcern() {
        didSet {
            avatarImageView.kf.setImage(with: URL(string: (myConcern.icon)))
            nameLabel.text = myConcern.name
            vipImageView.isHidden = !myConcern.is_verify
            tipsButton.isHidden = !myConcern.tips
            vipImageView.image = myConcern.user_auth_info.auth_type == 1 ? UIImage(named: "all_v_avatar_star_16x16_") : UIImage(named: "all_v_avatar_18x18_")
        }
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(avatarImageView)
        avatarImageView.image = UIImage.init(named: "head-1_36x36_")
//        self.contentView.addSubview(vipImageView)
        nameLabel.textColor = UIColor(hex: blackC)
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textAlignment = .center
        nameLabel.text = "关注的名字"
        self.contentView.addSubview(nameLabel)

//        self.contentView.addSubview(tipsButton)


    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.snp.makeConstraints { (mk) in
            mk.top.equalTo(self.contentView.snp.top).offset(5)
            mk.centerX.equalTo(self.contentView.snp.centerX).offset(0)
            mk.width.equalTo(40)
            mk.height.equalTo(40)
        }
        
        
        
        
        avatarImageView.layer.cornerRadius = 20
        avatarImageView.layer.masksToBounds = true
        
        nameLabel.snp.makeConstraints { (mk) in
            mk.top.equalTo(avatarImageView.snp.bottom).offset(0)
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            
        }
        
    }

}
