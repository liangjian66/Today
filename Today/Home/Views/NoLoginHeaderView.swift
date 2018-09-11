//
//  NoLoginHeaderView.swift
//  Today
//
//  Created by hywin on 2018/8/21.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class NoLoginHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() -> Void {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "wallpaper_profile_night")
        bgImageView.x = 200
        self.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (mk) in
            mk.top.equalTo(self.snp.top).offset(0)
            mk.left.equalTo(self.snp.left).offset(0)
            mk.right.equalTo(self.snp.right).offset(0)
            mk.height.equalTo(self.height)    // 链式语法直接定义宽高
        }
        
        let btnWidth = screenWidth*0.25
        
        let btnheight = 66
        
        
        
        let mobileButton =  UIButton()
        mobileButton.setImage(UIImage(named: "cellphoneicon_login_profile_66x66_"), for: .normal)
        bgImageView.addSubview(mobileButton)
        
        let btnTopMagin = 60
        
        
        mobileButton.snp.makeConstraints { (mk) in
            mk.top.equalTo(bgImageView.snp.top).offset(btnTopMagin)
            
            mk.left.equalTo(bgImageView.snp.left).offset(0)
            mk.width.equalTo(btnWidth)    //
            mk.height.equalTo(btnheight)    //
        }
        
        let wechatButton =  UIButton()
        wechatButton.setImage(UIImage(named: "weixinicon_login_profile_66x66_"), for: .normal)
        bgImageView.addSubview(wechatButton)
        
        wechatButton.snp.makeConstraints { (mk) in
            mk.top.equalTo(bgImageView.snp.top).offset(btnTopMagin)
            mk.left.equalTo(mobileButton.snp.right).offset(0)
            mk.width.equalTo(btnWidth)    //
            mk.height.equalTo(btnheight)    //
        }
        
        
        let qqButton =  UIButton()
        qqButton.setImage(UIImage(named: "qqicon_login_profile_66x66_"), for: .normal)
        bgImageView.addSubview(qqButton)
        
        qqButton.snp.makeConstraints { (mk) in
            mk.top.equalTo(bgImageView.snp.top).offset(btnTopMagin)
            mk.left.equalTo(wechatButton.snp.right).offset(0)
            mk.width.equalTo(btnWidth)    //
            mk.height.equalTo(btnheight)    //
        }
        
        
        let sinaButton =  UIButton()
        sinaButton.setImage(UIImage(named: "sinaicon_login_profile_66x66_"), for: .normal)
        bgImageView.addSubview(sinaButton)
        
        sinaButton.snp.makeConstraints { (mk) in
            mk.top.equalTo(bgImageView.snp.top).offset(btnTopMagin)
            mk.left.equalTo(qqButton.snp.right).offset(0)
            mk.width.equalTo(btnWidth)    //
            mk.height.equalTo(btnheight)    //
        }
        
        
        let moreLoginButton =  UIButton()
        
        moreLoginButton.setTitle("更多登录方式 >", for: .normal)
        moreLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        moreLoginButton.setTitleColor(UIColor.white, for: .normal)
        moreLoginButton.backgroundColor = UIColor.black
        moreLoginButton.layer.cornerRadius = 14;
        moreLoginButton.layer.masksToBounds = true
        bgImageView.addSubview(moreLoginButton)
        
        moreLoginButton.snp.makeConstraints { (mk) in
            mk.centerX.equalTo(bgImageView.snp.centerX).offset(0)
            mk.top.equalTo(sinaButton.snp.bottom).offset(20)
            mk.width.equalTo(125)    //
            mk.height.equalTo(28)    //
        }
        
        
        //
        let topmagin = 20
        let bottomBtnH = 80
        
        
        let favoriteButton =  SquareBtn()
        favoriteButton.setImage(UIImage(named: "favoriteicon_profile_24x24_"), for: .normal)
        favoriteButton.setTitle("收藏", for: .normal)
        favoriteButton.setTitleColor(UIColor.black, for: .normal)
        favoriteButton.backgroundColor = UIColor.white
        
        bgImageView.addSubview(favoriteButton)
        
        favoriteButton.snp.makeConstraints { (mk) in
            mk.bottom.equalTo(bgImageView.snp.bottom).offset(0)

            mk.left.equalTo(bgImageView.snp.left).offset(0)
            mk.width.equalTo(btnWidth*4/3)    //
            mk.height.equalTo(bottomBtnH)    //
            
        }
        
        
        let historyButton =  SquareBtn()
        historyButton.setImage(UIImage(named: "history_profile_24x24_"), for: .normal)
        historyButton.setTitle("历史", for: .normal)
        historyButton.setTitleColor(UIColor.black, for: .normal)
        
        historyButton.backgroundColor = UIColor.white
        
        bgImageView.addSubview(historyButton)
        
        historyButton.snp.makeConstraints { (mk) in
            mk.bottom.equalTo(bgImageView.snp.bottom).offset(0)

            mk.left.equalTo(favoriteButton.snp.right).offset(0)
            mk.width.equalTo(btnWidth*4/3)    //
            mk.height.equalTo(bottomBtnH)    //
            
        }
        
        let dayOrNightButton =  SquareBtn()
        dayOrNightButton.setImage(UIImage(named: "nighticon_profile_24x24_"), for: .normal)
        dayOrNightButton.setTitle("夜间", for: .normal)
        dayOrNightButton.setTitleColor(UIColor.black, for: .normal)
        
        dayOrNightButton.backgroundColor = UIColor.white
        
        bgImageView.addSubview(dayOrNightButton)
        
        dayOrNightButton.snp.makeConstraints { (mk) in
            mk.bottom.equalTo(bgImageView.snp.bottom).offset(0)
            
            mk.left.equalTo(historyButton.snp.right).offset(0)
            mk.width.equalTo(btnWidth*4/3)    //
            mk.height.equalTo(bottomBtnH)    //
            
        }
    }
    
    

}
