//
//  SquareBtn.swift
//  Today
//
//  Created by hywin on 2018/8/21.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import MJRefresh
class SquareBtn: UIButton  {

    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        self.imageView?.y = 0
        self.imageView?.x = 0

        self.imageView?.width = self.width*1
        self.imageView?.height = self.height*0.6
        self.imageView?.contentMode = .center
        
        
        
        // 调整文字
        
        self.titleLabel?.x = 0;
        self.titleLabel?.y = (self.imageView?.y)!+(self.imageView?.height)!
        self.titleLabel?.width = self.width;
        self.titleLabel?.height = self.height - (self.titleLabel?.y)!;
        
        self.titleLabel?.textAlignment = .center;
        self.titleLabel?.textColor = UIColor.black
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)



        
//        self.titleLabel.width = self.width
//        self.titleLabel.height = self.height - self.titleLabel.mj_y;
//        self.titleLabel.font=[UIFont systemFontOfSize:13];
//
//
//
//
//
//
//        self.imageView.mj_y = self.height * 0.15;
//        self.imageView.width = 30;
//        self.imageView.height = 30;
//        self.imageView.centerX = self.width * 0.5;
//
//        // 调整文字
//        self.titleLabel.mj_x = 0;
//        self.titleLabel.mj_y = CGRectGetMaxY(self.imageView.frame);
//        self.titleLabel.width = self.width;
//        self.titleLabel.height = self.height - self.titleLabel.mj_y;
//        self.titleLabel.font=[UIFont systemFontOfSize:13];
        
    }

}
