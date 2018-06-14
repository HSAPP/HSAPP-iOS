//
//  URLWithTitle.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/13/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation

struct URLWithTitle {
    var URL: URL
    var title: String
    
    init (URL: URL, title: String) {
        self.URL = URL
        self.title = title
    }
}
