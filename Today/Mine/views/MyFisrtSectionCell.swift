//
//  MyFisrtSectionCell.swift
//  Today
//
//  Created by hywin on 2018/8/23.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class MyFisrtSectionCell: UITableViewCell {
    private let leftLabel       = UILabel()
    private let rightLabel      = UILabel()
    private let rightImageView     = UIImageView()
    private var topView     = UIView()
    
//    open var collectionView UICollectionView
    
    open lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 40), collectionViewLayout: MyConcernFlowLayout())
           collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
    
    let MyConcernCellID = "MyConcernCellID"


    var myConcerns = [MyConcern]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var myCellModel = MyCellModel() {
        // set方法
        didSet {
            leftLabel.text = myCellModel.text
            rightLabel.text = myCellModel.grey_text
        }
    }
    /// 当只关注一个用户的时候，需要设置
    var myConcern = MyConcern() {
        didSet {
            
        }
    }
    

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    static private let identifier = "MyFisrtSectionCellID"

    
    class func createCell(tableView: UITableView, indexPath: NSIndexPath) -> MyFisrtSectionCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MyFisrtSectionCell
        if cell == nil {
            cell = MyFisrtSectionCell(style: .default, reuseIdentifier: identifier)
        }
        
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        topView.backgroundColor = UIColor.white
        self.contentView.addSubview(topView)
        
        // #aaaaaa
        leftLabel.font = UIFont.systemFont(ofSize: 15)
        leftLabel.textColor = UIColor(hex: blackC)
        topView.addSubview(leftLabel)
        
        rightLabel.font = UIFont.systemFont(ofSize: 14)
        rightLabel.textColor = UIColor(hex: cellRightTextColor)
        topView.addSubview(rightLabel)
        
        rightImageView.image = UIImage.init(named: "setting_rightarrow_8x14_")
        
        topView.addSubview(rightImageView)
        
        
        
//        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 40), collectionViewLayout: MyConcernFlowLayout())
        collectionView.backgroundColor = UIColor.white
        
//        collectionView.collectionViewLayout = MyConcernFlowLayout()

        self.contentView.addSubview(collectionView)
        
        

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyConcernCell.self, forCellWithReuseIdentifier: MyConcernCellID)
        
        
        

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topView.snp.makeConstraints { (mk) in
            mk.top.equalTo(self.contentView.snp.top).offset(0)
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.width.equalTo(screenWidth)
            mk.height.equalTo(44)
        }
        leftLabel.snp.makeConstraints { (mk) in
            mk.centerY.equalTo(topView.snp.centerY).offset(0)
            mk.left.equalTo(topView.snp.left).offset(20)
        }
        
        rightLabel.snp.makeConstraints { (mk) in
            mk.centerY.equalTo(topView.snp.centerY).offset(0)
            mk.right.equalTo(topView.snp.right).offset(-30)
        }
        
        rightImageView.snp.makeConstraints { (mk) in
            mk.centerY.equalTo(topView.snp.centerY).offset(0)
            mk.right.equalTo(topView.snp.right).offset(-15)
            mk.width.equalTo(8)
            mk.height.equalTo(14)
        }
        
        collectionView.snp.makeConstraints { (mk) in
            mk.top.equalTo(topView.snp.bottom).offset(0)
            mk.left.equalTo(self.contentView.snp.left).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(0)
            mk.bottom.equalTo(self.contentView.snp.bottom).offset(0)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MyFisrtSectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myConcerns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyConcernCellID, for: indexPath) as! MyConcernCell
        cell.myConcern = myConcerns[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        myConcernSelected?(myConcerns[indexPath.item])
    }
    
}

class MyConcernFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        // 每个 cell 的大小
        itemSize = CGSize(width: 58, height: 74)
        // 间距
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        // cell 上下左右的间距
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        // 设置水平滚动
        scrollDirection = .horizontal
    }
}
