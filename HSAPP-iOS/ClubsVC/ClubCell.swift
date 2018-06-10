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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 28)
        label.textColor = .white
        return label
    }()
    
    let memberCountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "person")
        return imageView
    }()
    
    let memberCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 20)
        label.textColor = .white
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "footballImage")
        return imageView
    }()
    
    let darkView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .black
        view.alpha = 0.55
        return view
    }()
    
    func setConstraints() {
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        darkView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        memberCountImageView.snp.makeConstraints { (make) in
            make.top.equalTo(memberCountLabel.snp.top).offset(2)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(18)
            make.width.equalTo(18)
        }
        
        memberCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(memberCountImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    func addSubviews() {
        self.addSubview(containerView)
        [backgroundImageView, darkView, titleLabel, memberCountImageView, memberCountLabel].forEach { (view) in
            self.containerView.addSubview(view)
        }
    }
    
    func setUp(club: Club) {
        
        addSubviews()
        setConstraints()
        
        self.club = club
        self.titleLabel.text = club.title
        self.memberCountLabel.text = String(club.memberCount)
        if let memberLimit = club.memberLimit {
            memberCountLabel.text?.append(" / \(memberLimit)")
        }
        
        self.selectionStyle = .none
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            darkView.alpha = 0.55
        } else {
            darkView.alpha = 0.35
        }
    }
}
