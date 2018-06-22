//
//  PersonalViewCell.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/22/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class PersonalViewCell: UITableViewCell {
    
    let darkView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.25
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 28)
        label.textColor = .white
        return label
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        let gradientLayer = CAGradientLayer()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func addSubviews() {
        [backgroundImageView, darkView, titleLabel].forEach { (view) in
            self.addSubview(view)
        }
    }
    
    func setContraints() {
        darkView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints({ (make) in
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        })
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func setUp(title: String, image: UIImage) {
        self.backgroundImageView.image = image
        self.titleLabel.text = title
        self.selectionStyle = .none
        self.addSubviews()
        self.setContraints()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            darkView.alpha = 0.45
        } else {
            darkView.alpha = 0.25
        }
    }
}
