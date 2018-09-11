//
//  VideoCell.swift
//  Today
//
//  Created by hywin on 2018/9/3.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    
    
     let bgImageButton      = UIButton()
    private let bottomView      = UIView()

    private let titleLabel         = UILabel()
    private let playCountLabel      = UILabel()
    private let timeLabel      = UILabel()
    private let avatarButton      = UIButton()
    private let vImageView      = UIImageView()
    private let nameLable      = UILabel()
    private let descriptionLabel      = UILabel()
    private let shareStackView      = UIStackView()
    private let shareLable      = UILabel()
    private let pyqButton      = UIButton()
    private let wechatButton      = UIButton()
    private let concernButton      = UIButton()
    private let commentButton      = UIButton()
    private let adButton      = UIButton()
    private let moreButton      = UIButton()
    
    
    // 数据处理
    var video = NewsModel() {
        didSet {
            titleLabel.text = video.title
            playCountLabel.text = video.video_detail_info.videoWatchCount + "次播放"
            avatarButton.kf.setImage(with: URL(string: video.user_info.avatar_url), for: .normal)
            vImageView.isHidden = !video.user_info.user_verified
            concernButton.isSelected = video.user_info.follow
            bgImageButton.kf.setBackgroundImage(with: URL(string: video.video_detail_info.detail_video_large_image.urlString)!, for: .normal)
            
            

            timeLabel.text = video.videoDuration
            commentButton.setTitle(video.commentCount, for: .normal)
            concernButton.isHidden = video.label_style == .ad
            nameLable.text = video.user_info.name
            
            
            let titleH = video.title.textHeight(fontSize: 20, width: screenWidth-30)
//            if titleH > 48 {
//               titleH = 48
//            }
            
            
//            titleLabel.snp.remakeConstraints() { (mk) in
//                mk.left.equalTo(self.contentView.snp.left).offset(15)
//                mk.right.equalTo(self.contentView.snp.right).offset(-15)
//                mk.top.equalTo(self.contentView.snp.top).offset(10)
////                mk.height.equalTo(titleH+2)
//            }
//
//            playCountLabel.snp.remakeConstraints { (mk) in
//                mk.left.equalTo(self.contentView.snp.left).offset(15)
//                mk.top.equalTo(titleLabel.snp.bottom).offset(5)
//            }



            
        }
    }



    static private let identifier = "VideoCellID"
    
    class func createCell(tableView: UITableView, indexPath: NSIndexPath) -> VideoCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? VideoCell
        if cell == nil {
            cell = VideoCell(style: .default, reuseIdentifier: identifier)
        }
        
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainUI()

    }
    func setupMainUI() {
        bgImageButton.setImage(UIImage.init(named: "video_play_icon_44x44_"), for: .normal)
        self.contentView.addSubview(bgImageButton)
        
        bottomView.backgroundColor = UIColor.white
        self.contentView.addSubview(bottomView)
        
        self.contentView.addSubview(avatarButton)
        vImageView.image = UIImage.init(named: "all_v_avatar_star_16x16_")
        avatarButton.addSubview(vImageView)
        
        
        //
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        self.contentView.addSubview(titleLabel)
        
        playCountLabel.textColor = UIColor.white
        playCountLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(playCountLabel)
        
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.backgroundColor = UIColor.lightGray
        timeLabel.alpha = 0.3
        timeLabel.textAlignment = .center
        bgImageButton.addSubview(timeLabel)
        
        moreButton.setImage(UIImage.init(named: "More_24x24_"), for: .normal)
        bottomView.addSubview(moreButton)
        
        
        commentButton.setImage(UIImage.init(named: "comment_24x24_"), for: .normal)
        commentButton.setTitle("138", for: .normal)
        commentButton.setTitleColor(UIColor(hex: blackC), for: .normal)
        bottomView.addSubview(commentButton)
        
        
        concernButton.setImage(UIImage.init(named: "video_add_24x24_"), for: .normal)
        concernButton.setTitle("关注", for: .normal)
        concernButton.setTitleColor(UIColor(hex: blackC), for: .normal)

        bottomView.addSubview(concernButton)
        
        shareLable.text = "分享到"
        bottomView.addSubview(shareLable)
        
        pyqButton.setImage(UIImage.init(named: "video_center_share_pyq_28x28_"), for: .normal)
        bottomView.addSubview(pyqButton)
        
        
        wechatButton.setImage(UIImage.init(named: "video_center_share_weChat_28x28_"), for: .normal)
        bottomView.addSubview(wechatButton)
        
        
        
        nameLable.text = "用户名"
        bottomView.addSubview(nameLable)


        showSubviews()
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bottomView.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)

            mk.height.equalTo(46)
        }
        //
        
        bgImageButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(bottomView.snp.top).offset(0)
            mk.top.equalTo(self.contentView.snp.top).offset(0)
            
        }
        avatarButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(15)
            mk.bottom.equalTo(bgImageButton.snp.bottom).offset(7)
            mk.height.equalTo(40)
            mk.width.equalTo(40)

        }
        avatarButton.layer.cornerRadius = 20
        avatarButton.layer.masksToBounds = true
        
        vImageView.snp.makeConstraints { (mk) in
            mk.right.equalTo(avatarButton.snp.right).offset(0)
            mk.bottom.equalTo(avatarButton.snp.bottom).offset(0)
            mk.height.equalTo(14)
            mk.width.equalTo(14)
        }
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(15)
            mk.right.equalTo(self.contentView.snp.right).offset(-15)
            mk.top.equalTo(self.contentView.snp.top).offset(10)
            mk.height.lessThanOrEqualTo(48)
        }
        
        playCountLabel.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.contentView.snp.left).offset(15)
            mk.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        
        
        timeLabel.snp.makeConstraints { (mk) in
            mk.right.equalTo(bgImageButton.snp.right).offset(-10)
            mk.bottom.equalTo(bgImageButton.snp.bottom).offset(-5)
            mk.height.equalTo(22)
            mk.width.equalTo(50)
        }
        
        timeLabel.layer.cornerRadius = 5
        timeLabel.layer.masksToBounds = true
        
        
        moreButton.snp.makeConstraints { (mk) in
            mk.right.equalTo(bottomView.snp.right).offset(0)
            mk.bottom.equalTo(bottomView.snp.bottom).offset(0)
            mk.top.equalTo(bottomView.snp.top).offset(0)

            mk.width.equalTo(40)
        }
        
        commentButton.snp.makeConstraints { (mk) in
            mk.right.equalTo(moreButton.snp.left).offset(-5)
            mk.bottom.equalTo(bottomView.snp.bottom).offset(0)
            mk.top.equalTo(bottomView.snp.top).offset(0)
            
        }
        
        concernButton.snp.makeConstraints { (mk) in
            mk.right.equalTo(commentButton.snp.left).offset(-5)
            mk.bottom.equalTo(bottomView.snp.bottom).offset(0)
            mk.top.equalTo(bottomView.snp.top).offset(0)
            
        }
        
        shareLable.snp.makeConstraints { (mk) in
            mk.left.equalTo(bottomView.snp.left).offset(15)
            mk.centerY.equalTo(bottomView.snp.centerY).offset(0)
            
        }
        
        pyqButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(shareLable.snp.right).offset(5)
            mk.centerY.equalTo(bottomView.snp.centerY).offset(0)
            mk.width.equalTo(30)
            mk.height.equalTo(46)

        }
        wechatButton.snp.makeConstraints { (mk) in
            mk.left.equalTo(pyqButton.snp.right).offset(5)
            mk.centerY.equalTo(bottomView.snp.centerY).offset(0)
            mk.width.equalTo(30)
            mk.height.equalTo(46)
            
        }
        
        nameLable.snp.makeConstraints { (mk) in
            mk.left.equalTo(bottomView.snp.left).offset(15)
            mk.centerY.equalTo(bottomView.snp.centerY).offset(0)
            
        }
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}

extension VideoCell {
    /// 视频播放时隐藏 cell 的部分子视图
    func hideSubviews() {
        titleLabel.isHidden = true
        playCountLabel.isHidden = true
        timeLabel.isHidden = true
        vImageView.isHidden = true
        avatarButton.isHidden = true
        nameLable.isHidden = true
        shareStackView.isHidden = false
        shareLable.isHidden = false
        
        pyqButton.isHidden = false
        wechatButton.isHidden = false
    }
    
    /// 设置当前 cell 的属性
    func showSubviews() {
        titleLabel.isHidden = false
        playCountLabel.isHidden = false
        timeLabel.isHidden = false
        avatarButton.isHidden = false
//        vImageView.isHidden = !video.user_verified
        nameLable.isHidden = false
        
        
        
//        shareStackView.isHidden = true
//          shareLable    wechatButton
        shareLable.isHidden = true

        pyqButton.isHidden = true
        wechatButton.isHidden = true

        
    }
}

