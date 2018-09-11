//
//  HuoshanNavigationBar.swift
//  Today
//
//  Created by hywin on 2018/9/7.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import SGPagingView



//   以后 真要 自律 只想  简简
class HuoshanNavigationBar: UIView {
    
    /// 点击了 标题
    var pageTitleViewSelected: ((_ index: Int)->())?
    
    var titleNames = [String]() {
        didSet {
            let configuration = SGPageTitleViewConfigure()
            configuration.titleColor = .black
            configuration.titleSelectedColor = .globalRedColor()
            configuration.indicatorColor = .clear
            pageTitleView = SGPageTitleView(frame: CGRect(x: -10, y: 0, width: screenWidth, height: 44), delegate: self, titleNames: titleNames, configure: configuration)
            pageTitleView!.backgroundColor = .clear
            addSubview(pageTitleView!)
        }
    }
    
    var pageTitleView: SGPageTitleView?
    
    /// 固有的大小
    override var intrinsicContentSize: CGSize {
        return UILayoutFittingExpandedSize
    }
    
    /// 重写 frame
    override var frame: CGRect {
        didSet {
            super.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 44)
        }
    }
    
}

extension HuoshanNavigationBar: SGPageTitleViewDelegate {
    
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        pageTitleViewSelected?(selectedIndex)
    }
    
}
