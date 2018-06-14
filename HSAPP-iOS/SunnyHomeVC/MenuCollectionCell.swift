//
//  MenuCollectionCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/14/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {
    
    //MARK: VARIABLES
    var menuItem: FoodItem?
    
    
    //MARK: OUTLETS
    
    private var containerView = UIView()
    
    private var foodImageView = UIImageView(image: #imageLiteral(resourceName: "cafeteriaImage"))
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 18)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 18)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    func addUIComponents() {
        self.addSubview(containerView)
        [titleLabel, descriptionLabel, priceLabel].forEach { (outlet) in
            containerView.addSubview(outlet)
        }
    }
    
    func addConstraints() {
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        foodImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(75)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(foodImageView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(foodImageView.snp.bottom).offset(16)
            make.right.equalToSuperview().offset(-20)
        }
        
    }
    
    func setUp() {
        addUIComponents()
        addConstraints()
        titleLabel.text = menuItem?.title
        descriptionLabel.text = menuItem?.description
        priceLabel.text = menuItem?.price
    }
}
