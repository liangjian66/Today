//
//  MyOtherCell.swift
//  Today
//
//  Created by hywin on 2018/8/23.
//  Copyright © 2018年 hywin. All rights reserved.
//

import UIKit

class MyOtherCell: UITableViewCell {

    private let leftLabel       = UILabel()
    private let rightLabel      = UILabel()
    private let rightImageView     = UIImageView()
    
    private let separatorView     = UIView()
    
    var myCellModel = MyCellModel() {
        // set方法
        didSet {
            leftLabel.text = myCellModel.text
            rightLabel.text = myCellModel.grey_text
        }
    }
    




    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static private let identifier = "MyOtherCellID"
    
    class func createCell(tableView: UITableView, indexPath: NSIndexPath) -> MyOtherCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MyOtherCell
        if cell == nil {
            cell = MyOtherCell(style: .default, reuseIdentifier: identifier)
        }

        
        return cell!
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // #aaaaaa
        leftLabel.font = UIFont.systemFont(ofSize: 15)
        leftLabel.textColor = UIColor(hex: blackC)
        self.contentView.addSubview(leftLabel)
        
        rightLabel.font = UIFont.systemFont(ofSize: 14)
        rightLabel.textColor = UIColor(hex: cellRightTextColor)
        self.contentView.addSubview(rightLabel)
        
        rightImageView.image = UIImage.init(named: "setting_rightarrow_8x14_")
        
        self.contentView.addSubview(rightImageView)

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        leftLabel.snp.makeConstraints { (mk) in
            mk.centerY.equalTo(self.contentView.snp.centerY).offset(0)
            mk.left.equalTo(self.contentView.snp.left).offset(20)
        }
        
        rightLabel.snp.makeConstraints { (mk) in
            mk.centerY.equalTo(self.contentView.snp.centerY).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(-30)
        }
        
        rightImageView.snp.makeConstraints { (mk) in
            mk.centerY.equalTo(self.contentView.snp.centerY).offset(0)
            mk.right.equalTo(self.contentView.snp.right).offset(-15)
            mk.width.equalTo(8)
            mk.height.equalTo(14)
        }
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
