//
//  MyTabBarController.swift
//  Today
//
//  Created by hywin on 2018/8/21.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit
import SwiftTheme



class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
//        tabbar.tintColor = UIColor.red
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"
        addChildViewControllers()

    }
    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home")
        setChildViewController(VideoViewController(), title: "西瓜视频", imageName: "video")
        //        setChildViewController(RedPackageViewController(), title: "", imageName: "redpackage")
        setChildViewController(HomeViewController(), title: "", imageName: "redpackage")
        
        setChildViewController(WeitoutiaoViewController(), title: "微头条", imageName: "weitoutiao")
        setChildViewController(HuoshanViewController(), title: "小视频", imageName: "huoshan")
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        //        setValue(MyTabBar(), forKey: "tabBar")
    }
    // 初始化子控制器
    private func setChildViewController (_ childController:UIViewController,title:String , imageName:String){
        
        childController.title = title
        
        setDayChildController(controller: childController, imageName: imageName)
        
        addChildViewController(MyNavigationController(rootViewController: childController))
        
    }
    
    /// 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    

}
