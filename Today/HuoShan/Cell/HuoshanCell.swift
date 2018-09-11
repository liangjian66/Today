//
//  HuoshanCell.swift
//  Today
//
//  Created by hywin on 2018/9/7.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class HuoshanCell: UICollectionViewCell {
    
    private let imageView       = UIImageView()
    private let titleLabel       = UILabel()
    private let diggCountLabel       = UILabel()
    private let playCountButton       = UIButton()
    private let closeButton       = UIButton()

    
    
    var smallVideo = NewsModel() {
        didSet {
            titleLabel.attributedText = smallVideo.raw_data.attrbutedText
            if let largeImage = smallVideo.raw_data.large_image_list.first {
                imageView.kf.setImage(with: URL(string: largeImage.urlString)!)
            } else if let firstImage = smallVideo.raw_data.first_frame_image_list.first {
                imageView.kf.setImage(with: URL(string: firstImage.urlString)!)
            }
            diggCountLabel.text = smallVideo.raw_data.action.diggCount + "赞"
            playCountButton.setTitle(smallVideo.raw_data.action.playCount + "次播放", for: .normal)
        }
    }
    
    
    




    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createUI() {
        self.contentView.addSubview(imageView)
        playCountButton.setImage(UIImage.init(named: "ugc_video_list_play_32x32_"), for: .normal)
        playCountButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        playCountButton.setTitleColor(UIColor.white, for: .normal)
        //
        self.contentView.addSubview(playCountButton)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(titleLabel)
        
        
        
        diggCountLabel.textColor = UIColor.white
        diggCountLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(diggCountLabel)
        closeButton.setImage(UIImage(named: "ImgPic_close_24x24_"), for: .normal)
        self.contentView.addSubview(closeButton)



        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.snp.makeConstraints { (mk) in
            mk.top.equalTo(self.contentView.snp.top).offset(0)
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            
        }
        
        
        playCountButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(15)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
            
        }
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(15)
            mk.right.equalTo(self.contentView.snp.right).offset(-15)
            mk.bottom.equalTo(playCountButton.snp.top).offset(-5)
            
        }
        
        
        diggCountLabel.snp.makeConstraints { (mk) in
            mk.right.equalTo(self.contentView.snp.right).offset(-15)
            mk.centerY.equalTo(playCountButton.snp.centerY).offset(0)
            
        }
        
        closeButton.snp.makeConstraints { (mk) in
            mk.right.equalTo(self.contentView.snp.right).offset(-5)
            mk.top.equalTo(self.contentView.snp.top).offset(5)
            mk.width.height.equalTo(24)
        }
        
        
    }
    
}
