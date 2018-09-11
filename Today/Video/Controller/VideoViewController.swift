//
//  VideoViewController.swift
//  Today
//
//  Created by hywin on 2018/9/5.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import SGPagingView
import RxSwift

class VideoViewController: UIViewController {
    private lazy var disposeBag = DisposeBag()
    /// 标题和内容
    private var pageTitleView: SGPageTitleView?
    private var pageContentView: SGPageContentScrollView?
    
private lazy var navigationBar = HomeNavigationView(frame: CGRect(x: 0, y: 0, width: screenWidth-20, height: 44))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background" ), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

// MARK: - 导航栏按钮点击
extension VideoViewController {
    /// 设置 UI
    private func setupUI() {
        view.theme_backgroundColor = "colors.cellBackgroundColor"
        // 设置自定义导航栏
        navigationItem.titleView = navigationBar
        // 视频顶部新闻标题的数据
        NetworkTool.loadVideoApiCategoies {
            let configuration = SGPageTitleViewConfigure()
            configuration.titleColor = .black
            configuration.titleSelectedColor = .globalRedColor()
            configuration.indicatorColor = .clear
            // 标题名称的数组
            self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: newsTitleHeight), delegate: self, titleNames: $0.compactMap({ $0.name }), configure: configuration)
            self.pageTitleView!.backgroundColor = .clear
            self.view.addSubview(self.pageTitleView!)
            // 设置子控制器
            _ = $0.compactMap({ (newsTitle) -> () in
                let videoTableVC = VideoTableViewController()
                videoTableVC.setupRefresh(with: newsTitle.category)
                self.addChildViewController(videoTableVC)
            })
            // 内容视图
            // 内容视图
            
            self.pageContentView = SGPageContentScrollView(frame: CGRect(x: 0, y: newsTitleHeight, width: screenWidth, height: self.view.height - newsTitleHeight), parentVC: self, childVCs: self.childViewControllers)
            
            self.pageContentView!.delegatePageContentScrollView = self
            self.view.addSubview(self.pageContentView!)
        }
    }

}


// MARK: - SGPageTitleViewDelegate
extension VideoViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentView!.setPageContentScrollViewCurrentIndex(selectedIndex)
    }
    
    /// 联动 SGPageTitleView 的方法
    func pageContentScrollView(_ pageContentView: SGPageContentScrollView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.pageTitleView!.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
