//
//  MenuItemCell.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/11/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class MenuItemCell: UITableViewCell {
    
    var menuItem: MenuItem?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 16)
        label.textAlignment = .right
        return label
    }()
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.top)
            make.left.equalTo(titleLabel.snp.right).offset(32)
            make.right.equalToSuperview().offset(-16)
            make.width.equalTo(titleLabel.snp.width)
        }
    }
    
    func addSubviews() {
        [titleLabel, priceLabel].forEach { (view) in
            self.addSubview(view)
        }
    }
    
    func setUp(menuItem: MenuItem) {
        self.menuItem = menuItem
        
        self.titleLabel.text = menuItem.title
        self.priceLabel.text = "$ " + String(menuItem.price)
        
        addSubviews()
        setConstraints()
    }
}
