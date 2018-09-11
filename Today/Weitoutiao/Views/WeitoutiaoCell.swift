//
//  WeitoutiaoCell.swift
//  Today
//
//  Created by hywin on 2018/8/28.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import IBAnimatable
import Kingfisher

class WeitoutiaoCell: UITableViewCell {
    
    
    open lazy var pictCollectView: DongtaiCollectionView = {
        let pictCollectView = DongtaiCollectionView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 40), collectionViewLayout: DongtaiCollectionViewFlowLayout())
        pictCollectView.showsVerticalScrollIndicator = false
        return pictCollectView
    }()
    
    
    
    var aNews = NewsModel() {
        didSet {
            avatarImageView.kf.setImage(with: URL(string: aNews.user.avatar_url))
            vImageView.isHidden = !aNews.user.user_verified
            nameLabel.text = aNews.user.name
            timeAndDescriptionLabel.text = aNews.createTime + (aNews.user.verified_content != "" ? (" · \(aNews.user.user_verified)") : "")
            
             likeButton.setTitle(aNews.digg_count == 0 ? "赞" : aNews.diggCount, for: .normal)
             likeButton.isSelected = aNews.user_digg
            commentButton.setTitle(aNews.commentCount, for: .normal)
            
            forwardButton.setTitle(aNews.forward_info.forwardCount, for: .normal)
            concernButton.isSelected = aNews.user.is_following
      areaLabel.text = (aNews.position.position != "" ? "\(aNews.position.position) · " : "" ) + aNews.readCount + "阅读 " + (aNews.brand_info != "" ? aNews.brand_info : "")
            
            contentLabel.attributedText = aNews.attributedContent

            contentLabel.snp.updateConstraints() { (mk) in
                
                mk.height.equalTo(aNews.contentH)
                
            }
            

            
            
            middleView.snp.updateConstraints() { (mk) in
           
                mk.height.equalTo(aNews.collectionViewH)
                


            }
            layoutIfNeeded()
            

            if middleView.contains(pictCollectView) { pictCollectView.removeFromSuperview() }
            if aNews.thumb_image_list.count != 0 {
                middleView.addSubview(pictCollectView)
                pictCollectView.snp.remakeConstraints() { (mk) in

                    mk.left.equalTo(middleView.snp.left).offset(0)
                    mk.right.equalTo(middleView.snp.right).offset(0)
                    mk.top.equalTo(middleView.snp.top).offset(0)
                    mk.bottom.equalTo(middleView.snp.bottom).offset(0)

                }

                pictCollectView.thumbImages = aNews.thumb_image_list
                
            }

        }
    }
    
    
    private let avatarImageView      = AnimatableImageView()
    private let vImageView      = UIImageView()
    private let nameLabel      = UILabel()
    private let   topView    =  UIView()
    
    private let timeAndDescriptionLabel      = UILabel()
    private let concernButton      = UIButton()
    private let closeButton      = UIButton()
    private let contentLabel      = RichLabel()
    
    
    
    private let middleView      = UIView()  // 图片内容
    
    
    private let likeButton      = UIButton()
    private let commentButton      = UIButton()
    private let forwardButton      = UIButton()
    
    
    private let areaLabel      = UILabel()
    private let separatorView      = UIView()
    private let separatorView2      = UIView()
    private let bottomView      = UIView()  // 底部视图
    private let coverButton      = UIButton()
    
    private let buttonView      = UIView()  // 底部视图



    static private let identifier = "WeitoutiaoCellID"
    
    class func createCell(tableView: UITableView, indexPath: NSIndexPath) -> WeitoutiaoCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? WeitoutiaoCell
        if cell == nil {
            cell = WeitoutiaoCell(style: .default, reuseIdentifier: identifier)
        }
        
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.contentView.addSubview(topView)
        topView.addSubview(avatarImageView)
        avatarImageView.addSubview(vImageView)
        
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = UIColor(hex: blackC)
        topView.addSubview(nameLabel)
        
        
        
        timeAndDescriptionLabel.font = UIFont.systemFont(ofSize: 11)
        timeAndDescriptionLabel.textColor = UIColor(hex: cellRightTextColor)
        topView.addSubview(timeAndDescriptionLabel)
        
        closeButton.setImage(UIImage(named: "add_textpage_17x12_"), for: .normal)
        topView.addSubview(closeButton)
        
        concernButton.setTitle("关注", for: .normal)
        concernButton.setTitleColor(UIColor(hex: globalRedColor), for: .normal)
        topView.addSubview(concernButton)
        
        contentLabel.numberOfLines = 0;
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        contentLabel.textColor = UIColor(hex: blackColor)
        self.contentView.addSubview(contentLabel)
        
        
        
        
        self.contentView.addSubview(middleView)  // 图片
        
        self.contentView.addSubview(bottomView)  // 图片

        
        
//        middleView.addSubview(pictCollectView)
        
        
        
        
        areaLabel.font = UIFont.systemFont(ofSize: 11)
        areaLabel.textColor = UIColor(hex: blackC)
        bottomView.addSubview(areaLabel)

        separatorView.backgroundColor = UIColor(hex: separatorViewColor)
        bottomView.addSubview(separatorView)

        bottomView.addSubview(buttonView)
        
        separatorView2.backgroundColor = UIColor(hex: separatorViewColor)
        bottomView.addSubview(separatorView2)
        
        forwardButton .setImage(UIImage.init(named: "feed_share_24x24_"), for: .normal)
        forwardButton.setTitle("100", for: .normal)
        forwardButton.setTitleColor(UIColor(hex: blackC), for: .normal)
        buttonView.addSubview(forwardButton)
        
        commentButton .setImage(UIImage.init(named: "comment_feed_24x24_"), for: .normal)
        commentButton.setTitle("100", for: .normal)
        commentButton.setTitleColor(UIColor(hex: blackC), for: .normal)



        buttonView.addSubview(commentButton)
        
        likeButton .setImage(UIImage.init(named: "feed_like_24x24_"), for: .normal)
        likeButton.setTitle("100", for: .normal)
        likeButton.setTitleColor(UIColor(hex: blackC), for: .normal)


        buttonView.addSubview(likeButton)



        

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topView.snp.makeConstraints { (mk) in
            mk.top.equalTo(self.contentView.snp.top).offset(0)
            mk.left.equalTo(self.contentView.snp.left).offset(0)

            mk.right.equalTo(self.contentView.snp.right).offset(0)

            mk.height.equalTo(50)
            
           

        }
        avatarImageView.snp.makeConstraints { (mk) in
            mk.centerY.equalTo(topView.snp.centerY).offset(0)
            mk.left.equalTo(topView.snp.left).offset(15)
            mk.height.equalTo(35)
            mk.width.equalTo(35)

        }
        vImageView.snp.makeConstraints { (mk) in
            mk.bottom.equalTo(avatarImageView.snp.bottom).offset(0)
            mk.right.equalTo(avatarImageView.snp.right).offset(0)
            mk.height.equalTo(16)
            mk.width.equalTo(16)
            
        }
        nameLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(avatarImageView.snp.right).offset(5)
            mk.top.equalTo(avatarImageView.snp.top).offset(0)
            
        }
        
        timeAndDescriptionLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(avatarImageView.snp.right).offset(5)
            mk.bottom.equalTo(avatarImageView.snp.bottom).offset(0)
            
        }
        
        closeButton.snp.makeConstraints { (mk) in
            
            mk.centerY.equalTo(topView.snp.centerY).offset(0)
            mk.right.equalTo(topView.snp.right).offset(-15)

        
            mk.height.equalTo(15)
            mk.width.equalTo(17)
            
        }
        
        concernButton.snp.makeConstraints { (mk) in
            
            mk.centerY.equalTo(topView.snp.centerY).offset(0)
            mk.right.equalTo(closeButton.snp.left).offset(-5)
            mk.height.equalTo(30)
            
            mk.width.equalTo(60)
            
        }
        
        contentLabel.snp.makeConstraints { (mk) in
            
            mk.left.equalTo(self.contentView.snp.left).offset(15)
            mk.right.equalTo(self.contentView.snp.right).offset(-15)
            mk.top.equalTo(topView.snp.bottom).offset(0)
//            mk.height.equalTo(0)
            
        }
        
        
        middleView.snp.makeConstraints { (mk) in
            
            mk.left.equalTo(self.contentView.snp.left).offset(15)
            mk.right.equalTo(self.contentView.snp.right).offset(-15)
            mk.top.equalTo(contentLabel.snp.bottom).offset(0)
            
//            mk.height.equalTo(0)
            
        }
        
//        pictCollectView.snp.makeConstraints { (mk) in
//
//            mk.left.equalTo(middleView.snp.left).offset(0)
//            mk.right.equalTo(middleView.snp.right).offset(0)
//            mk.top.equalTo(middleView.snp.top).offset(0)
//            mk.bottom.equalTo(middleView.snp.bottom).offset(0)
//
//
//        }
        
        
        
        
        bottomView.snp.makeConstraints { (mk) in
            
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.top.equalTo(middleView.snp.bottom).offset(0)
            
            mk.height.equalTo(65)
            
        }
        
        
        areaLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(bottomView.snp.left).offset(15)
            mk.top.equalTo(bottomView.snp.top).offset(0)
            
        }
        
        separatorView.snp.makeConstraints { (mk) in
            mk.left.equalTo(bottomView.snp.left).offset(0)
            mk.right.equalTo(bottomView.snp.right).offset(0)
            mk.top.equalTo(areaLabel.snp.bottom).offset(5)
            mk.height.equalTo(0.5)
        }
        
       
        
        separatorView2.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            mk.height.equalTo(5)
        }
        
        
        buttonView.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.top.equalTo(separatorView.snp.bottom).offset(0)

            mk.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
        }
        
        let btnWidth = screenWidth/3
        forwardButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(buttonView.snp.left).offset(0)
            mk.top.equalTo(buttonView.snp.top).offset(0)
            mk.height.equalTo(buttonView)
            mk.width.equalTo(btnWidth)

        }
        
        commentButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(forwardButton.snp.right).offset(0)
            mk.top.equalTo(buttonView.snp.top).offset(0)
            mk.height.equalTo(buttonView)
            mk.width.equalTo(btnWidth)
        }
        
        likeButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(commentButton.snp.right).offset(0)
            mk.top.equalTo(buttonView.snp.top).offset(0)
            mk.height.equalTo(buttonView)
            mk.width.equalTo(btnWidth)

        }
        
        
        
        
        
        
        
        
        
    }
}
