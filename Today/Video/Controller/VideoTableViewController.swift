//
//  VideoTableViewController.swift
//  Today
//
//  Created by hywin on 2018/9/4.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

import SVProgressHUD
import RxSwift
import RxCocoa
import BMPlayer
import NVActivityIndicatorView
import SnapKit
import BMPlayer




class VideoTableViewController: HomeTableViewController {
    private lazy var disposeBag = DisposeBag()
    /// 上一次播放的 cell
    private var priorCell: VideoCell?
    /// 视频真实地址
    private var realVideo = RealVideo()
    
    /// 当前播放的时间
    private var currentTime: TimeInterval = 0
    
  
    


    override func viewDidLoad() {
        super.viewDidLoad()
        player.delegate = self
        tableView.rowHeight = screenWidth * 0.67
        tableView.tableFooterView = UIView()
        setupRefresh(with: .video)
    }
    

    

}

extension VideoTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = VideoCell.createCell(tableView: tableView, indexPath: indexPath as NSIndexPath)
        cell.video = news[indexPath.row]
        

        
        cell.bgImageButton.rx.tap.subscribe(onNext : {[weak self] in
            
            if let priorCell = self!.priorCell{
                // 设置当前 cell 的属性
                priorCell.showSubviews()
                // 判断当前播放器是否正在播放
                if self!.player.isPlaying {
                    self!.player.pause()
                    self!.player.removeFromSuperview()
                }
                // 把播放器添加到 cell 上
                self!.addPlayer(on: cell)
            }else {
                // 把播放器添加到 cell 上
                self!.addPlayer(on: cell)
            }
            
            
            
        }).disposed(by: disposeBag)

        return cell
    }
    
}
extension VideoTableViewController {
    private func addPlayer(on cell: VideoCell) {
        cell.hideSubviews()
        // 解析头条的视频真实播放地址
        NetworkTool.parseVideoRealURL(video_id: cell.video.video_detail_info.video_id, completionHandler: {
            self.realVideo = $0
            cell.bgImageButton.addSubview(self.player)
            self.player.snp.makeConstraints({ $0.edges.equalTo(cell.bgImageButton) })
            // 设置视频播放地址
            self.player.setVideo(resource: BMPlayerResource(url: URL(string: $0.video_list.video_1.mainURL)!))
            self.priorCell = cell
            
            //
        })
    }
    
    /// 移除播放器
    private func removePlayer() {
        player.pause()
        player.removeFromSuperview()
        priorCell = nil
    }
    
    
}

extension VideoTableViewController: BMPlayerDelegate {
    
    func bmPlayer(player: BMPlayer, playerStateDidChange state: BMPlayerState) {
        
    }
    
    func bmPlayer(player: BMPlayer, loadedTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playTimeDidChange currentTime: TimeInterval, totalTime: TimeInterval) {
        self.currentTime = currentTime
    }
    
    func bmPlayer(player: BMPlayer, playerIsPlaying playing: Bool) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerOrientChanged isFullscreen: Bool) {
        
    }
}
