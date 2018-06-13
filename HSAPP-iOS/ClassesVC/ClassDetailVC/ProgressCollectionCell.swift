//
//  InProgressAssignmentCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/10/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class InProgressAssignmentCell: UICollectionViewCell {
    
    
    var assignment: Assignment?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 18)
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    private var gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 22)
        return label
    }()
    
    private var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 14)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    private var containerView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 7
        view.backgroundColor = UIColor.AppColors.viewWhite
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 7
       return view
    }()
    
    private func addLabels() {
        self.addSubview(containerView)
        [titleLabel, dateLabel, gradeLabel, scoreLabel].forEach { (label) in
            containerView.addSubview(label)
        }
    }
    
    private func setUpConstraints() {
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            
        }
        
        gradeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.top)
            make.right.equalToSuperview().offset(-20)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(gradeLabel.snp.bottom).offset(4)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func setUp(assignment: Assignment) {

        self.assignment = assignment
        addLabels()
        setUpConstraints()
        titleLabel.text = assignment.title
        dateLabel.text = assignment.dueDate
        scoreLabel.text = assignment.score
        gradeLabel.text = assignment.grade
        
    }
}
