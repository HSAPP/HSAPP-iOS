//
//  Event.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/6/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct Event {
    var title: String
    var date: String
    var place: String
    var description: String
    
    init(title: String, date: String, place: String, description: String) {
        self.title = title
        self.date = date
        self.place = place
        self.description = description
    }
}
