//
//  Club.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct Club {
    var title: String
    var description: String
    var leadName: String
    var meetingTimes: [Date]
    var memberCount: Int
    var memberLimit: Int?
    
    init(title: String, description: String, leadName: String, memberCount: Int, memberLimit: Int?, meetingTimes: [Date]) {
        self.description = description
        self.title = title
        self.memberCount = memberCount
        self.leadName = leadName
        self.meetingTimes = meetingTimes
        if let memberLimit = memberLimit {
            self.memberLimit = memberLimit
        }
    }
}
