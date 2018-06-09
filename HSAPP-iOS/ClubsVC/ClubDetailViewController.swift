//
//  ClubDetailViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/9/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ClubDetailViewController: UIViewController {
    
    var club: Club?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }
    
    func setUpViewController(club: Club) {
        self.club = club
    }
    
    func setUpNavBar() {
        self.title = club?.title
        self.view.backgroundColor = .white
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.firstLineHeadIndent = 0
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle]
    }
    
    
}
