//
//  ClassCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/7/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class ClassCell: UITableViewCell {

    var Classroom: Classroom?
    private var sideSpace = 20
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 26)
        return label
    }()
    
    private var gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 20)
        return label
    }()
    
    private var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 14)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    private var assignmentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 12)
        label.textColor = UIColor.gray
        return label
    }()
    
    private func addLabelsToCell() {
        self.addSubview(titleLabel)
        self.addSubview(gradeLabel)
        self.addSubview(scoreLabel)
        self.addSubview(assignmentsLabel)
    }
    
    private func setUpConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
        gradeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.top).offset(4)
//            make.left.equalTo(titleLabel.snp.right).offset(45)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(gradeLabel.snp.bottom).offset(12)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
        assignmentsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(sideSpace)
            make.right.equalToSuperview().offset(-sideSpace)
        }
        
    }
    
    func setUp(classroom: Classroom) {
        addLabelsToCell()
        setUpConstraints()
        self.Classroom = classroom
        
        titleLabel.text = classroom.title
        gradeLabel.text = classroom.grade
        assignmentsLabel.text = "\(classroom.assignments.count) assignments are due"
        scoreLabel.text = classroom.score
    }
    
    //this never gets called because we're not using any nib/xib files
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        // Initialization code
//    }


}
