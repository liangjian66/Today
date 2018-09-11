//
//  HomeCell.swift
//  Today
//
//  Created by hywin on 2018/8/30.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import IBAnimatable

class HomeCell: UITableViewCell {
    open lazy var collectionView: HomeImageCollectionView = {
        let collectionView = HomeImageCollectionView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 40), collectionViewLayout: DongtaiCollectionViewFlowLayout())
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()  
    
    // 传数据
    var aNews = NewsModel() {
        
        
        didSet {
            rightImageView.image = nil
            collectionView.removeFromSuperview()
            if middleView.subviews.count != 0 {  }
            titleLabel.text = aNews.title
            
            commentCountLabel.text = (aNews.comment_count == 0 ? "" : aNews.commentCount + "评论")
            publishTimeLabel.text = aNews.publishTime
            
            // 设置广告标签
//            adOrHotLabel.textColor = UIColor.globalRedColor()
//            adOrHotLabel.borderColor = .globalRedColor()
            
            adOrHotLabel.text = aNews.label

            nameLabel.text = aNews.user_info.name
            
            if aNews.hot {
                adOrHotLabel.text = "热"
                adOrHotLabel.snp.updateConstraints() { (mk) in
                    
                    mk.width.equalTo(20)
                    
                }
                
                nameLabel.snp.updateConstraints() { (mk) in
                    
                    mk.left.equalTo(titleLabel.snp.left).offset(30)

                }
                
            } else if aNews.is_stick || aNews.label == "直播" || aNews.label == "影视" { setupAdLabel() }
            else if aNews.label_style == .ad {  // 广告
                adOrHotLabel.textColor = .blueFontColor()
//                adOrHotLabel.borderColor = .lightGray
                setupAdLabel()
                if aNews.sub_title != "" {
//                    subTitleLabel.text = aNews.sub_title
//                    bottomViewHeight.constant = 40
//                    downloadButton.setImage(UIImage(named: "download_ad_feed_13x13_"), for: .normal)
                }
            } else {  
                adOrHotLabel.text = ""
//                adOrHotLabelWidth.constant = 0
                adOrHotLabel.snp.updateConstraints() { (mk) in
                    
                    mk.width.equalTo(0)
                    
                }
//                nameLabelLeading.constant = 0
                nameLabel.snp.updateConstraints() { (mk) in
                    
                    mk.left.equalTo(titleLabel.snp.left).offset(0)
                    
                }
            }
        // 判断 有没有视频
            if aNews.video_duration != 0 && aNews.has_video { // 有视频
                
            }else {  // 没有视频
                if aNews.middle_image.url != "" && aNews.image_list.count == 0 {
                    rightImageView.kf.setImage(with: URL(string: aNews.middle_image.urlString)!)
                    rightImageView.snp.updateConstraints() { (mk) in
                        
                        mk.width.equalTo(screenWidth * 0.28)
                    }
                    
                } else {
                    setupRightImageView()
                    if aNews.image_list.count == 1 { // 右侧显示图片
                        rightImageView.kf.setImage(with: URL(string: aNews.image_list.first!.urlString)!)
                        rightImageView.snp.updateConstraints() { (mk) in
                            
                            mk.width.equalTo(screenWidth * 0.28)
                        }
                        
                    } else {
                        
                        middleView.snp.updateConstraints() { (mk) in
                            
                            mk.height.equalTo(image3Width)
                        }
                        middleView.addSubview(collectionView)
                        collectionView.frame = CGRect(x: 0, y: 0, width: screenWidth - 30, height: image3Width)
                        collectionView.images = aNews.image_list
                    }
                }
                
            }

        }
    }
    
    
    private func setupAdLabel() {
//        adOrHotLabelWidth.constant = 32
        adOrHotLabel.snp.updateConstraints() { (mk) in
            
            mk.width.equalTo(32)
            
        }
//        nameLabelLeading.constant = 37
        nameLabel.snp.updateConstraints() { (mk) in
            
            mk.left.equalTo(titleLabel.snp.left).offset(37)
            
        }
    }
    private func setupRightImageView() {
        rightImageView.snp.updateConstraints() { (mk) in
            mk.width.equalTo(0)
        }
        rightTimeButton.setTitle("", for: .normal)
    }
    
    
    private let titleLabel      = UILabel() // 标题
    private let nameLabel      = UILabel()  // 名称
    
    private let adOrHotLabel      = UILabel()  // 名称
   
    
    
    
    private let commentCountLabel      = UILabel()
    private let publishTimeLabel      = UILabel()
    private let rightImageView      = UIImageView()
    private let rightTimeButton      = UIButton()  // 左侧时长
    private let addTextpageButton      = UIButton()  // 关闭按钮
    private let middleView      =  UIView()
    private let bottomView      = UIView()
   




    
    
    

    static private let identifier = "HomeCellID"
    
    class func createCell(tableView: UITableView, indexPath: NSIndexPath) -> HomeCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? HomeCell
        if cell == nil {
            cell = HomeCell(style: .default, reuseIdentifier: identifier)
        }
        
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         setupMainUI()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 布局子控件
    func setupMainUI() {
        self.contentView.addSubview(rightImageView)
        
        self.contentView.addSubview(rightTimeButton)

        self.contentView.addSubview(addTextpageButton)


        
       
        
        
        
        addTextpageButton.setImage(UIImage.init(named: "add_textpage_17x12_"), for: .normal)

        //  标题
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        self.contentView.addSubview(titleLabel)
        
        adOrHotLabel.textColor = UIColor.globalRedColor()
        adOrHotLabel.text = "热"
        adOrHotLabel.font = UIFont.systemFont(ofSize: 12)
//        adOrHotLabel.layer.cornerRadius = 5
//        adOrHotLabel.layer.masksToBounds =  true
        adOrHotLabel.layer.borderColor = UIColor.globalRedColor().cgColor
         adOrHotLabel.layer.borderWidth = 1.0
        self.contentView.addSubview(adOrHotLabel)

        // nameLabel
        nameLabel.textColor  = UIColor.lightGray
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.text  = "用户名"
        self.contentView.addSubview(nameLabel)
        
        
        // commentCountLabel
        commentCountLabel.textColor  = UIColor.lightGray
        commentCountLabel.font = UIFont.systemFont(ofSize: 13)
        commentCountLabel.text  = "评论"
        self.contentView.addSubview(commentCountLabel)
        
        // publishTimeLabel
        publishTimeLabel.textColor  = UIColor.lightGray
        publishTimeLabel.font = UIFont.systemFont(ofSize: 13)
//        publishTimeLabel.text  = "发布时间"
        self.contentView.addSubview(publishTimeLabel)

        self.contentView.addSubview(middleView)

        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let leftMagin = 15
        
        
        rightImageView.snp.makeConstraints { (mk) in
            mk.right.equalTo(self.contentView.snp.right).offset(-10)
            
            mk.top.equalTo(self.contentView.snp.top).offset(10)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
//            mk.width.equalTo(0)
        }
        
        rightTimeButton.snp.makeConstraints { (mk) in
            mk.right.equalTo(rightImageView.snp.left).offset(0)
            
            mk.bottom.equalTo(rightImageView.snp.bottom).offset(0)
            mk.width.equalTo(0)
            mk.height.equalTo(22)

        }
        
        addTextpageButton.snp.makeConstraints { (mk) in
            mk.right.equalTo(rightImageView.snp.left).offset(-5)
            
            mk.bottom.equalTo(rightImageView.snp.bottom).offset(0)
            mk.width.equalTo(17)
            mk.height.equalTo(15)
            
        }
        
        
        
        
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(leftMagin)
            mk.right.equalTo(rightImageView.snp.left).offset(-5)
            mk.top.equalTo(self.contentView.snp.top).offset(5)
            mk.height.lessThanOrEqualTo(42)

        }
        
        
        
        
        adOrHotLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(titleLabel.snp.left).offset(0)
            
            mk.bottom.equalTo(rightImageView.snp.bottom).offset(0)
            mk.width.equalTo(25)
            
        }
        adOrHotLabel.layer.borderColor = UIColor.globalRedColor().cgColor
        adOrHotLabel.layer.borderWidth = 1.0
        
        
        nameLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(titleLabel.snp.left).offset(30)
            
            mk.centerY.equalTo(adOrHotLabel.snp.centerY).offset(0)
            mk.height.equalTo(16)

        }
        
        commentCountLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(nameLabel.snp.right).offset(5)
            
            mk.centerY.equalTo(nameLabel.snp.centerY).offset(0)
            mk.height.equalTo(16)
            
        }
        
        publishTimeLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(commentCountLabel.snp.right).offset(5)
            
            mk.centerY.equalTo(nameLabel.snp.centerY).offset(0)
            mk.height.equalTo(16)
            
        }
        
        middleView.snp.makeConstraints { (mk) in
            mk.left.equalTo(titleLabel.snp.left).offset(0)
            
            mk.right.equalTo(rightImageView.snp.left).offset(-5)
            mk.top.equalTo(titleLabel.snp.bottom).offset(5)

        }
        
        
        
        
        
        
        
    }


}
