//
//  TableviewHeaderHelper.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/10/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation
import UIKit

struct HeaderHelper {
    static  func createTasksTitleHeaderView(title: String, fontSize: CGFloat, frame: CGRect, color: UIColor) -> UIView
    {
        let vw = UIView(frame:frame)
        vw.backgroundColor = color
        let titleLabel = UILabel()
        titleLabel.clipsToBounds = false
        titleLabel.textColor = UIColor.black
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: ".SFUIText-Bold", size: 25)
        titleLabel.bounds.size.width = vw.bounds.width / 3

        
        
        vw.addSubview(titleLabel)
        // Constraints
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(30)
        }
        
        
        return vw
    }
}

