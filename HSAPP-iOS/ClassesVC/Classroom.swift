//
//  Classroom.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/7/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct Classroom {
    var title: String
    var grade: String
    var score: String
    var assignments: [Assignment]
    
    
    init(title: String, grade: String, score: String, assignments: [Assignment]) {
        self.title = title
        self.grade = grade
        self.score = score
        self.assignments = assignments
    }
    
}
