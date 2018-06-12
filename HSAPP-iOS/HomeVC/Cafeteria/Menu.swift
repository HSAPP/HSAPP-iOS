//
//  Menu.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/11/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct MenuItem {
    var price: Float
    var title: String
    var ingredientList: [String]
    var isVegetarian: Bool?
    var isGlutenFree: Bool?
    var isVegan: Bool?
    
    init (price: Float, title: String, ingredientList: [String], isVegetarian: Bool?, isGlutenFree: Bool?, isVegan: Bool?) {
        self.price = price
        self.title = title
        self.ingredientList = ingredientList
        self.isVegetarian = isVegetarian
        self.isVegan = isVegan
        self.isGlutenFree = isGlutenFree
    }
}
