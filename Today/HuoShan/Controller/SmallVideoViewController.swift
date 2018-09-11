//
//  SmallVideoViewController.swift
//  Today
//
//  Created by hywin on 2018/9/10.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import BMPlayer
import NVActivityIndicatorView
import SnapKit

class SmallVideoViewController: UIViewController {
    /// 播放器
    private lazy var player : BMPlayer = BMPlayer(customControlView: SmallVideoPlayerCustomView())
    private let disposeBag = DisposeBag()
    
    /// 小视频数组
    var smallVideos = [NewsModel]()
    /// 原始 索引
    var originalIndex = 0
    /// 当前索引
    var currentIndex = 0
    
    
    // 导航View
    private let topTitleView       = UIView()
    // 底部View
    private let bottomView       = UIView()
    
    private let closeBtn       = UIButton()
    
    private let titleBtn       = UIButton()
    
    private let moreBtn       = UIButton()
    
    // 分享
    private let shareBtn       = UIButton()
    
    // 点赞
    private let diggBtn       = UIButton()
    // 评论
    private let commentBtn       = UIButton()
    
    
    private let writeView       =  UIView()
    private let writeBtn       = UIButton()
    
     let collectionViewID       = "SmallVideoCellID"

    

    


    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    

}

extension SmallVideoViewController {
    
    func setupUI() {
        
        
        self.view.backgroundColor = UIColor.white
        
        topTitleView.backgroundColor = UIColor.clear
        self.view.addSubview(topTitleView)
        let topMagin = isIPhoneX ? 40 : 0
        topTitleView.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.view.snp.left).offset(0)
            mk.right.equalTo(self.view.snp.right).offset(0)
            mk.top.equalTo(self.view.snp.top).offset(topMagin)
            mk.height.equalTo(44)
        }
        closeBtn.setImage(UIImage(named: "ImgPic_close_24x24_"), for: .normal)
        topTitleView.addSubview(closeBtn)
        closeBtn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
        closeBtn.snp.makeConstraints { (mk) in
            mk.left.equalTo(topTitleView.snp.left).offset(15)
            mk.bottom.equalTo(topTitleView.snp.bottom).offset(0)
            mk.top.equalTo(topTitleView.snp.top).offset(0)
            mk.width.equalTo(24)
        }
        
        topTitleView.addSubview(titleBtn)
        titleBtn.snp.makeConstraints { (mk) in
            mk.centerX.equalTo(topTitleView.snp.centerX).offset(0)
            mk.centerY.equalTo(topTitleView.snp.centerY).offset(0)
        }
        moreBtn.setImage(UIImage(named: "new_morewhite_titlebar_22x22_"), for: .normal)
        topTitleView.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { (mk) in
            mk.right.equalTo(topTitleView.snp.right).offset(-15)
            mk.bottom.equalTo(topTitleView.snp.bottom).offset(0)
            mk.top.equalTo(topTitleView.snp.top).offset(0)
            mk.width.equalTo(24)
        }  //
        
        
        
        
        let bottomMagin = isIPhoneX ? 34 : 0

        bottomView.backgroundColor = UIColor.clear
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (mk) in
            mk.left.equalTo(self.view.snp.left).offset(0)
            mk.right.equalTo(self.view.snp.right).offset(0)
            mk.bottom.equalTo(self.view.snp.bottom).offset(-bottomMagin)
            mk.height.equalTo(60)
        }
        shareBtn.setImage(UIImage(named: "icon_details_share_24x24_"), for: .normal)
        bottomView.addSubview(shareBtn)
        
        shareBtn.snp.makeConstraints { (mk) in
            mk.right.equalTo(bottomView.snp.right).offset(-15)
            mk.bottom.equalTo(bottomView.snp.bottom).offset(0)
            mk.top.equalTo(bottomView.snp.top).offset(0)
            mk.width.equalTo(45)
        }  //
        
        
        diggBtn.setImage(UIImage(named: "hts_vp_like_24x24_"), for: .normal)
        bottomView.addSubview(diggBtn)
        diggBtn.snp.makeConstraints { (mk) in
            mk.right.equalTo(shareBtn.snp.left).offset(0)
            mk.bottom.equalTo(bottomView.snp.bottom).offset(0)
            mk.top.equalTo(bottomView.snp.top).offset(0)
            mk.width.equalTo(45)
        }  //
        
        // 评论
        commentBtn.setImage(UIImage(named: "icon_details_comment_24x24_"), for: .normal)
        bottomView.addSubview(commentBtn)
        commentBtn.snp.makeConstraints { (mk) in
            mk.right.equalTo(diggBtn.snp.left).offset(0)
            mk.bottom.equalTo(bottomView.snp.bottom).offset(0)
            mk.top.equalTo(bottomView.snp.top).offset(0)
            mk.width.equalTo(45)
        }  //
        
        writeView.backgroundColor = UIColor.lightGray
        bottomView.addSubview(writeView)
        writeView.snp.makeConstraints { (mk) in
            mk.left.equalTo(bottomView.snp.left).offset(15)
            mk.centerY.equalTo(bottomView.snp.centerY).offset(0)
            mk.right.equalTo(commentBtn.snp.left).offset(-20)
            mk.height.equalTo(30)
        }  //
        writeView.backgroundColor = UIColor.lightGray
        writeView.layer.cornerRadius = 15
        writeView.layer.masksToBounds = true
        
        writeBtn.setImage(UIImage(named: "write_white_24x24"), for: .normal)
        writeBtn.setTitle("写评论", for: .normal)
        writeBtn.setTitleColor(UIColor.white, for: .normal)
        writeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        writeBtn.titleLabel?.textColor = UIColor.white
        writeView.addSubview(writeBtn)
        writeBtn.snp.makeConstraints { (mk) in
            mk.left.equalTo(writeView.snp.left).offset(10)
            mk.top.equalTo(writeView.snp.top).offset(0)
            mk.bottom.equalTo(writeView.snp.bottom).offset(0)
            mk.width.equalTo(60)
        }  //
        

        
        //  设置数据
        
        let smallVideo = smallVideos[originalIndex]
        switch smallVideo.raw_data.group_source {
        case .huoshan:
//            titleButton.theme_setImage("images.huoshan_logo_new_100x28_", forState: .normal)
            titleBtn.setImage(UIImage(named: "douyin_logo_new_100x28_"), for: .normal)

        case .douyin:
//            titleButton.theme_setImage("images.douyin_logo_new_100x28_", forState: .normal)
            titleBtn.setImage(UIImage(named: "douyin_logo_new_100x28_"), for: .normal)
        }
        commentBtn.setTitle(smallVideo.raw_data.action.commentCount, for: .normal)
        diggBtn.setTitle(smallVideo.raw_data.action.diggCount, for: .normal)
        

        
        setupPlayer(currentIndex: originalIndex)
        
        
        
    
    }
    
    
    /// 设置播放器
    private func setupPlayer(currentIndex: Int) {
        // 当前的视频
        let smallVide = smallVideos[currentIndex]
        if let videoURLString = smallVide.raw_data.video.play_addr.url_list.first {
            // https://aweme.snssdk.com/aweme/v1/play/?video_id=887cc4819fd543e68125b471142de2ee&line=0&app_id=13
            // http://v9-dy.ixigua.com/f0c5b6992b84ec8581be670a9f0e6db6/5a5f3713/video/m/220dcaa08afe2814fe982a551581d7051c311518ee4000028f420dbd167/
            let dataTask = URLSession.shared.dataTask(with: URL(string: videoURLString)!, completionHandler: { (data, response, error) in
                // 货到主线程添加播放器
                DispatchQueue.main.async {
                    // 获取当前的 cell
//                    let cell = self.collectionView.cellForItem(at: IndexPath(item: currentIndex, section: 0)) as! SmallVideoCell
                    if self.player.isPlaying { self.player.pause() }
                    // 先把 bgImageView 的子视图移除，再添加
//                    for subview in cell.bgImageView.subviews { subview.removeFromSuperview() }
//                    cell.bgImageView.addSubview(self.player)
                    self.view.insertSubview(self.player , at: 0)

                self.player.snp.makeConstraints({ $0.edges.equalTo(self.view) })
                    
                    
                    let asset = BMPlayerResource(url: URL(string: response!.url!.absoluteString)!)
                    self.player.setVideo(resource: asset)
                }
            })
            dataTask.resume()
        }
        
 
 
    }
    
    
    
    
   @objc func closeBtnClick()  {
        dismiss(animated: false, completion: nil)
    }
}


