//
//  HomeViewController.swift
//  Today
//
//  Created by hywin on 2018/8/21.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import SGPagingView
import RxSwift
import RxCocoa


class HomeViewController: UIViewController {
    
    
    private lazy var disposeBag = DisposeBag()

    private lazy var navigationBar = HomeNavigationView(frame: CGRect(x: 0, y: 0, width: screenWidth-20, height: 44))
    
    /// 标题和内容
    private var pageTitleView: SGPageTitleView?
    private var pageContentView: SGPageContentScrollView?
    
    /// 添加频道按钮
    private lazy var addChannelButton: UIButton = {
        let addChannelButton = UIButton(frame: CGRect(x: screenWidth - newsTitleHeight, y: 0, width: newsTitleHeight, height: newsTitleHeight))
        addChannelButton.setImage(UIImage.init(named: "add_channel_titlbar_thin_new_16x16_"), for: .normal)
        
        let separatorView = UIView(frame: CGRect(x: 0, y: newsTitleHeight - 1, width: newsTitleHeight, height: 1))
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        addChannelButton.addSubview(separatorView)
        return addChannelButton
    }()
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.keyWindow?.backgroundColor = UIColor(hex: windowColor)
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background"), for: .default)
        navigationItem.titleView = navigationBar

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createMainUI()
        // 点击事件
        clickAction()

    }

    
    

}

// MARK: - 导航栏按钮点击
extension HomeViewController {
    func createMainUI()  {
        // 设置自定义导航栏

        navigationItem.titleView = navigationBar
        // 添加频道
        view.addSubview(addChannelButton)
        
        NetworkTool.loadHomeNewsTitleData{
            
            
            NewsTitleTable().insert($0)
            let configuration = SGPageTitleViewConfigure()
            configuration.titleColor = .black
            configuration.titleSelectedColor = .globalRedColor()
            configuration.indicatorColor = .clear
            
            // 标题名称的数组
            self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: 0, width: screenWidth - newsTitleHeight, height: newsTitleHeight), delegate: self, titleNames: $0.compactMap({ $0.name }), configure: configuration)
        
            
            self.pageTitleView!.backgroundColor = .clear
            self.view.addSubview(self.pageTitleView!)
            // 设置子控制器
            _ = $0.compactMap({ (newsTitle) -> () in
                
                
                switch newsTitle.category {
 
                
                case .video:
                    let videoVC = VideoTableViewController()
                    self.addChildViewController(videoVC)
                    
                default :
                    let homeTableVC = HomeRecommendController()
                    homeTableVC.setupRefresh(with: newsTitle.category)

                    self.addChildViewController(homeTableVC)
                
                }
            })
            // 内容视图
            
            self.pageContentView = SGPageContentScrollView(frame: CGRect(x: 0, y: newsTitleHeight, width: screenWidth, height: self.view.height - newsTitleHeight), parentVC: self, childVCs: self.childViewControllers)
            
            self.pageContentView!.delegatePageContentScrollView = self
            
            
            
            self.view.addSubview(self.pageContentView!)

        }
       
        
    }
    /// 点击事件
    private func clickAction() {
        
        // 头像按钮点击
        navigationBar.didSelectAvatarButton = { [weak self] in
            self!.navigationController?.pushViewController(MineViewController(), animated: true)
        }
        
        
        addChannelButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            print("addChannelButton click")
        }).disposed(by: disposeBag)

    }
}


// MARK: - SGPageTitleViewDelegate
extension HomeViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentView!.setPageContentScrollViewCurrentIndex(selectedIndex)
    }
    
    /// 联动 SGPageTitleView 的方法
    func pageContentScrollView(_ pageContentView: SGPageContentScrollView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.pageTitleView!.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}


