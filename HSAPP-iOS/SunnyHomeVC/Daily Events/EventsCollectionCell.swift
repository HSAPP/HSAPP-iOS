//
//  EventsCollectionCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/23/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class EventsCollectionCell: UICollectionViewCell {
    
    var event: Event?
    
    
    //MARK: UICOMPONENTS
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.AppColors.viewWhite
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 7
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 18)
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 14)
        return label
    }()
    
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 14)
        return label
    }()
    
    private func addUI() {
        self.contentView.addSubview(containerView)
        [titleLabel, dateLabel, locationLabel].forEach { (label) in
            containerView.addSubview(label)
        }
    }
    
    private func setUpConstraints() {
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
    
    func setUp(event: Event) {
        self.event = event
        titleLabel.text = event.title
        dateLabel.text = event.date
        locationLabel.text = event.place
        addUI()
        setUpConstraints()
    }
    
}
