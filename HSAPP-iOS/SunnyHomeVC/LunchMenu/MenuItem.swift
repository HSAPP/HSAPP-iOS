//
//  MenuItem.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/14/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct FoodItem {
    var title: String
    var description: String
    var price: String
    
    init(title: String, description: String, price: String) {
        self.title = title
        self.description = description
        self.price = price
    }
}
