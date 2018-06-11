//
//  EventCell.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/6/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class EventCell: UITableViewCell {
    
    var event: Event?
    
    private let sideSpace = 20
    
    private func setConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(dateImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
        dateImageView.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.top).offset(2)
            make.left.equalToSuperview().offset(sideSpace)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
        placeImageView.snp.makeConstraints { (make) in
            make.top.equalTo(placeLabel.snp.top).offset(2)
            make.left.equalToSuperview().offset(sideSpace)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        placeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
        if self.event?.price != nil {
            self.priceImageView.snp.makeConstraints { (make) in
                make.top.equalTo(priceLabel.snp.top).offset(2)
                make.left.equalToSuperview().offset(sideSpace)
                make.height.equalTo(16)
                make.width.equalTo(16)
            }

            self.priceLabel.snp.makeConstraints { (make) in
                make.top.equalTo(placeLabel.snp.bottom).offset(16)
                make.left.equalTo(titleLabel.snp.left)
                make.right.equalToSuperview().offset(-sideSpace)
            }

            self.descriptionLabel.snp.makeConstraints { (make) in
                make.top.equalTo(priceLabel.snp.bottom).offset(16)
            }
        } else {
        
            self.descriptionLabel.snp.makeConstraints { (make) in
                make.top.equalTo(placeLabel.snp.bottom).offset(16)
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 28)
//        label.textAlignment = .center
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
        label.textColor = UIColor.AppColors.lightBlue
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText", size: 14)
        label.numberOfLines = 2
        label.textColor = UIColor.darkGray
        return label
    }()
    
    private let placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "location")
        return imageView
    }()
    
    private let dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Clock")
        return imageView
    }()
    
    private let priceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "DollarSign")
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
        return label
    }()
    
    private func addLabelsToCell() {
        [titleLabel, dateLabel, placeLabel, descriptionLabel, placeImageView, dateImageView].forEach { (view) in
            self.addSubview(view)
        }
        if (self.event?.price) != nil {
            [priceImageView, priceLabel].forEach { (view) in
                self.addSubview(view)
            }
        }
    }
    
    func setUp(event: Event) {
        
        self.event = event
        
        addLabelsToCell()
        setConstraints()
        
        titleLabel.text = event.title
        dateLabel.text = event.date
        placeLabel.text = event.place
        descriptionLabel.text = event.description
        if let price = event.price {
            priceLabel.text = String(price)
        }
    }
    
}
