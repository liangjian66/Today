//
//  WeitoutiaoViewController.swift
//  Today
//
//  Created by hywin on 2018/8/27.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class WeitoutiaoViewController: HomeTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
       setupRefresh(with: .weitoutiao)

    }

    


    

}

extension WeitoutiaoViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let aNews = news[indexPath.row]
        return aNews.weitoutiaoHeight
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = WeitoutiaoCell.createCell(tableView: tableView, indexPath: indexPath as NSIndexPath)
        cell.aNews = news[indexPath.row]

        return cell
    }
}
