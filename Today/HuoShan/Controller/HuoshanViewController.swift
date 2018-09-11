//
//  HuoshanViewController.swift
//  Today
//
//  Created by hywin on 2018/9/5.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import SGPagingView


class HuoshanViewController: UIViewController {
    var pageContentView: SGPageContentScrollView?
    /// 懒加载 导航栏
    private lazy var navigationBar = HuoshanNavigationBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white"), for: .default)
        

        // 设置 UI
        setupUI()
        
    }
    

    

}

extension HuoshanViewController {
    /// 设置 UI
    private func setupUI() {
        navigationItem.titleView = navigationBar
        // 小视频导航栏标题的数据
        // 小视频导航栏标题的数据
        NetworkTool.loadSmallVideoCategories {
            self.navigationBar.titleNames = $0.compactMap({ $0.name })
            // 设置子控制器
            _ = $0.compactMap({ (newsTitle) -> () in
                let categoryVC = HuoshanCategoryController()
                categoryVC.newsTitle = newsTitle
                self.addChildViewController(categoryVC)
            })
            // 内容视图
            self.pageContentView = SGPageContentScrollView(frame: self.view.bounds, parentVC: self, childVCs: self.childViewControllers)
            
            self.pageContentView!.delegatePageContentScrollView = self
            self.view.addSubview(self.pageContentView!)
//            self.pageContentView!.setPageContentViewCurrentIndex($0)
            
        }
        // 点击了 标题
        navigationBar.pageTitleViewSelected = { [weak self] in
            self!.pageContentView?.setPageContentScrollViewCurrentIndex($0)
        }

    }
    

}

// MARK: - SGPageContentViewDelegate
extension HuoshanViewController: SGPageContentScrollViewDelegate {
    /// 联动 SGPageTitleView 的方法
    
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentView!.setPageContentScrollViewCurrentIndex(selectedIndex)
    }
    
    /// 联动 SGPageTitleView 的方法
    func pageContentScrollView(_ pageContentView: SGPageContentScrollView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
//        self.pageTitleView!.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
    
}
