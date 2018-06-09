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
    var memberCount: Int
    var memberLimit: Int?
    
    init(title: String, description: String, memberCount: Int, memberLimit: Int?) {
        self.description = description
        self.title = title
        self.memberCount = memberCount
        if let memberLimit = memberLimit {
            self.memberLimit = memberLimit
        }
    }
}
