//
//  Announcement.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/13/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct Announcement {
    var description: String
    var title: String
    var links: [URLWithTitle]
    
    init (description: String, title: String, links: [URLWithTitle]) {
        self.description = description
        self.title = title
        self.links = links
    }
}
