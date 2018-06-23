//
//  AssignmentCollectionCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/22/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class AssignmentCollectionCell: UICollectionViewCell {
    
    //MARK: VARIABLES
    var assignment: Assignment?
    
    //MARK: UICOMPONENTS
    private var containerView = UIView()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 18)
        return label
    }()
    
    private var classLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 12)
        return label
    }()
    
    private var dueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 12)
        return label
    }()
    
    func setUp(assignment: Assignment) {
        addUIComponents()
        setConstraints()
        self.assignment = assignment
        titleLabel.text = assignment.title
        classLabel.text = assignment.classroom
        dueLabel.text = "Today"
        
        
    }
    
    private func addUIComponents() {
        self.contentView.addSubview(containerView)
        [titleLabel, classLabel, dueLabel].forEach { (label) in
            containerView.addSubview(label)
        }
    }
    
    private func setConstraints() {
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        classLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        dueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(classLabel.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
    
}
