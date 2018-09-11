//
//  MineViewController.swift
//  Today
//
//  Created by hywin on 2018/8/22.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift


class MineViewController: UITableViewController {
//    private lazy var headerView = NoLoginHeaderView{
//
//    }

    
    
    private let disposeBag = DisposeBag()
    // 存储 cell的数据
    var sections = [[MyCellModel]]()
    // 存储我的关注数据
    var concerns = [MyConcern]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white" )), for: .default)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white"), for: .default)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(hex: tableViewBackgroundColor)
        tableView.backgroundColor = UIColor.white
        let nologView = NoLoginHeaderView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 304))
//        let nologView = NoLoginHeaderView()
        
        tableView.tableHeaderView = nologView
//        tableView.separatorStyle = .none
        NetworkTool.loadMyCellData { (mysections : [[MyCellModel]]) -> () in
            //            self.sections = $0
            self.sections = mysections
            
            self.tableView.reloadData()
            NetworkTool.loadMyConcern(completionHandler: {
                self.concerns = $0
                print(self.concerns)
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            })
            
        }

        
    }
    
    

    // MARK: - Table view data source

    

    

    
}
extension  MineViewController{
    
    // 每组头部的高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    
    // 每组头部视图
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.theme_backgroundColor = "colors.tableViewBackgroundColor"
        return view
    }
    // 行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return (concerns.count == 0 || concerns.count == 1) ? 40 : 114
        }
        return 40
    }
    
    // 组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    // 每组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    // cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = MyFisrtSectionCell.createCell(tableView: tableView, indexPath: indexPath as NSIndexPath) 
            
            cell.myCellModel = sections[indexPath.section][indexPath.row]
            cell.collectionView.isHidden = (concerns.count == 0 || concerns.count == 1)
            if concerns.count == 1 { cell.myConcern = concerns[0] }
            if concerns.count > 1 { cell.myConcerns = concerns }
            
            
            return cell
        }
        
        let cell = MyOtherCell.createCell(tableView: tableView, indexPath: indexPath as NSIndexPath)
        let myCellModel = sections[indexPath.section][indexPath.row]
        
        cell.myCellModel = myCellModel
        return cell
    }
    
}

