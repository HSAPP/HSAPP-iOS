//
//  ClassDetailHeaderView.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/9/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation
import UIKit

class CDView: UIView {
    
    //MARK: UICOMPONENTS
    let teacherImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Sunny"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let teacherNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 18)
        
        return label
    }()
    
    let gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 30)
        
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 24)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    
     init(frame: CGRect, classroom: Classroom) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.AppColors.backgroundWhite
        gradeLabel.text = "A"
        scoreLabel.text = classroom.score
        teacherNameLabel.text = "S. Ouyang"
        addUIComponents()
        layoutConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addUIComponents() {
        self.addSubview(teacherImage)
        self.addSubview(teacherNameLabel)
        self.addSubview(gradeLabel)
        self.addSubview(scoreLabel)
    }
    
    private func layoutConstraints() {
        teacherImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        teacherNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(teacherImage.snp.right).offset(2)
        }
        
        gradeLabel.snp.makeConstraints { (make) in
        
            make.top.equalTo(teacherImage.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(gradeLabel.snp.bottom).offset(4)
            make.right.equalToSuperview().offset(-20)
        }
        
        
    }
    
}

