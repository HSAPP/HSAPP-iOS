//
//  Assignment.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/7/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct Assignment {
    var title: String
    var dueDate: String
    var score: String
    var grade: String?
    var classroom: String?
    
    init(title: String, dueDate: String, score: String, grade: String, classroom: String) {
        self.title = title
        self.dueDate = dueDate
        self.score = score
        self.grade = grade
        self.classroom = classroom
    }
    
}
