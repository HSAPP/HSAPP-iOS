//
//  HomeCell.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/11/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class CafeteriaCell: UITableViewCell {
    
    var menu: [MenuItem]?
    
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
        imageView.image = #imageLiteral(resourceName: "cafeteriaImage")
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
        label.text = "Cafeteria Menu"
        label.textColor = .white
        return label
    }()
    
    func setConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        darkView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
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
    
    func setUp(menu: [MenuItem]) {
        self.menu = menu
        addSubviews()
        setConstraints()
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
