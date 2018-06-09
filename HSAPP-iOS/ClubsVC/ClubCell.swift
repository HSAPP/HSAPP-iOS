//
//  ClubCell.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class ClubCell: UITableViewCell {
    
    var club: Club?
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText", size: 14)
        label.numberOfLines = 2
        label.textColor = UIColor.darkGray
        label.numberOfLines = 3
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 28)
        return label
    }()
    
    let memberCountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "person")
        return imageView
    }()
    
    let memberCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
        return label
    }()
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(memberCountImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-20)
        }
        
        memberCountImageView.snp.makeConstraints { (make) in
            make.top.equalTo(memberCountLabel.snp.top).offset(2)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        memberCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    func addSubviews() {
        [descriptionLabel, titleLabel, memberCountImageView, memberCountLabel].forEach { (view) in
            self.addSubview(view)
        }
    }
    
    func setUp(club: Club) {
        
        addSubviews()
        setConstraints()
        
        self.club = club
        self.descriptionLabel.text = club.description
        self.titleLabel.text = club.title
        self.memberCountLabel.text = String(club.memberCount)
        if let memberLimit = club.memberLimit {
            memberCountLabel.text?.append(" / \(memberLimit)")
        }
        
    }
}
