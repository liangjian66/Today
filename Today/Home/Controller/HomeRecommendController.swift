//
//  HomeRecommendController.swift
//  Today
//
//  Created by hywin on 2018/8/30.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class HomeRecommendController: HomeTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
//        setupRefresh(with: .recommend)
    }



    
}


extension HomeRecommendController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let aNews = news[indexPath.row]
        return aNews.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = HomeCell.createCell(tableView: tableView, indexPath: indexPath as NSIndexPath)
        cell.aNews = news[indexPath.row]
        return cell
    }
    
    //
    
}
