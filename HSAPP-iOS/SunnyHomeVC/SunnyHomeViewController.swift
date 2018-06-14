//
//  SunnyHomeViewController.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/14/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class SunnyHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: VARIABLES
    var announcements = [Any]()

    var homeTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setUpTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(MenuTableCell.self, forCellReuseIdentifier: "MenuTableCell")
        
        homeTableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: TABLEVIEW FUNCTIONS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return announcements.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
