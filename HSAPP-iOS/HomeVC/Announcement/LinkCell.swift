//
//  LinkCell.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/13/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class LinkCell: UICollectionViewCell {
    
    var urlWithTitle: URLWithTitle?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 18)
        label.textColor = UIColor.AppColors.lightBlue
        label.textAlignment = .center
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.backgroundColor = UIColor.AppColors.viewWhite
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 7
        return view
    }()
    
    func setConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addSubviews() {
        self.addSubview(containerView)
        [titleLabel].forEach { (view) in
            self.containerView.addSubview(view)
        }
    }
    
    func setUp(urlWithTitle: URLWithTitle) {
        self.urlWithTitle = urlWithTitle
        self.titleLabel.text = urlWithTitle.title
        addSubviews()
        setConstraints()
    }
}

