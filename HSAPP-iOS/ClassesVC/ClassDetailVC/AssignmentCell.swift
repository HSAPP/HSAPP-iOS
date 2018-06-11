//
//  AssignmentCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class AssignmentCell: UITableViewCell {
    
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
    
    private func addLabels() {
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
        self.addSubview(gradeLabel)
        self.addSubview(scoreLabel)
    }
    
    private func setUpConstraints() {
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
            //            make.left.equalTo(titleLabel.snp.right).offset(45)
            make.right.equalToSuperview().offset(-20)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(gradeLabel.snp.bottom).offset(6)
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
