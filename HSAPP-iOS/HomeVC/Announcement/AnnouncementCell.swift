//
//  AnnouncementCell.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/13/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class AnnouncementCell: UITableViewCell {
    
    var announcement: Announcement?
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "satImage")
        return imageView
    }()
    
    let darkView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.35
        view.layer.cornerRadius = 5
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 28)
        label.textColor = .white
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
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
    }
    
    func addSubviews() {
        self.addSubview(containerView)
        [backgroundImageView, darkView, titleLabel].forEach { (view) in
            self.containerView.addSubview(view)
        }
    }
    
    func setUp(announcement: Announcement) {
        self.announcement = announcement
        
        self.titleLabel.text = announcement.title
        
        self.addSubviews()
        self.setConstraints()
        
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
