//
//  VideoPlayerCustomView.swift
//  Today
//
//  Created by hywin on 2018/9/4.
//  Copyright © 2018年 hywin. All rights reserved.
//

import BMPlayer
import SnapKit

class VideoPlayerCustomView: BMPlayerControlView {

    override func customizeUIComponents() {
        BMPlayerConf.topBarShowInCase = .none
    }

}
