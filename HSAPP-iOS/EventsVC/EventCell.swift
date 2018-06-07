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
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
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
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
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
            make.top.equalTo(placeLabel.snp.bottom).offset(16)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 28)
//        label.textAlignment = .center
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
//        label.textAlignment = .center
        return label
    }()
    
    private var placeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText", size: 14)
        label.numberOfLines = 2
        label.textColor = UIColor.darkGray
        return label
    }()
    
    private var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        return imageView
    }()
    
    private var dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Clock")
        return imageView
    }()
    
    private func addLabelsToCell() {
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
        self.addSubview(placeLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(placeImageView)
        self.addSubview(dateImageView)
    }
    
    
    
    func setUp(event: Event) {
        
        addLabelsToCell()
        setConstraints()
        
        self.event = event
        titleLabel.text = event.title
        dateLabel.text = event.date
        placeLabel.text = event.place
        descriptionLabel.text = event.description
        
        
    }
    
    
}
