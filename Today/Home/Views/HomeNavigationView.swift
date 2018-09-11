//
//  HomeNavigationView.swift
//  Today
//
//  Created by hywin on 2018/8/24.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import IBAnimatable
import SnapKit

class HomeNavigationView: UIView {
 
    let avatarButton  = UIButton()
    let cameraButton  = UIButton()
    
    let searchButton  = AnimatableButton()
    
    /// 搜索按钮点击
    var didSelectSearchButton: (()->())?
    /// 头像按钮点击
    var didSelectAvatarButton: (()->())?
    /// 相机按钮点击
    var didSelectCameraButton: (()->())?


    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
//    /// 重写 frame
//    override var frame: CGRect {
//        didSet {
//            super.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 44)
//        }
//    }
    
    
    fileprivate func commonInit() -> Void {
        
        
        avatarButton.setImage(UIImage.init(named: "home_no_login_head"), for: .normal)
        avatarButton.addTarget(self,action:#selector(avatarButtonClick), for: .touchUpInside)
        self.addSubview(avatarButton)
        cameraButton.setImage(UIImage.init(named: "home_camera"), for: .normal)

        self.addSubview(cameraButton)
        searchButton.setImage(UIImage.init(named: "search_small_16x16_"), for: .normal)
        searchButton.setTitle("搜索内容", for: .normal)
        searchButton.setTitleColor(UIColor.lightGray, for: .normal)
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        searchButton.backgroundColor = UIColor.white
        searchButton.layer.cornerRadius = 5
        searchButton.layer.masksToBounds = true
        self.addSubview(searchButton)


        
    }
    
    override var intrinsicContentSize: CGSize{
        return UILayoutFittingExpandedSize
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarButton.snp.makeConstraints { (mk) in
           mk.width.height.equalTo(30)
           mk.centerY.equalToSuperview()
           mk.left.equalTo(self.snp.left).offset(10)
        
        }
        
        cameraButton.snp.makeConstraints { (mk) in
            mk.width.height.equalTo(30)
            mk.centerY.equalToSuperview()
            mk.right.equalTo(self.snp.right).offset(-10)
            
        }
        searchButton.snp.makeConstraints { (mk) in
            mk.height.equalTo(30)
            mk.centerY.equalToSuperview()
            mk.right.equalTo(self.snp.right).offset(-45)
            mk.left.equalTo(self.snp.left).offset(45)
            
        }
        
        
        
    }
    
    @objc func avatarButtonClick() -> Void {
        didSelectAvatarButton?()
    }

}
