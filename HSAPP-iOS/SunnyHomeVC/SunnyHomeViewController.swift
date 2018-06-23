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
    
    
    //MARK: UICOMPONENTS
    
    var collectionViews = [UICollectionView]()
    var homeTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.AppColors.backgroundWhite
        self.title = "Home"
        setUpNavBar()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let p = NSMutableParagraphStyle()
        p.firstLineHeadIndent = 0
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: p]
    }
    
    func setUpTableView() {
        homeTableView.backgroundColor = UIColor.AppColors.backgroundWhite
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(MenuTableCell.self, forCellReuseIdentifier: "MenuTableCell")
        homeTableView.register(AssignmentsTableCell.self, forCellReuseIdentifier: "AssignmentsTableCell")
        homeTableView.register(EventsTableCell.self, forCellReuseIdentifier: "DailyEventsTableCell")
        self.view.addSubview(homeTableView)
        
        homeTableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: TABLEVIEW FUNCTIONS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "MenuTableCell") as! MenuTableCell
            cell.setUp(forRow: indexPath.row)
            
            return cell
        } else if indexPath.section == 1 {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "AssignmentsTableCell") as! AssignmentsTableCell
            cell.setUp(forRow: indexPath.row)
            
            return cell
        } else if indexPath.section == 2 {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "DailyEventsTableCell") as! EventsTableCell
            cell.setUp(forRow: indexPath.row)
            return cell
        } else {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "MenuTableCell") as! MenuTableCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = HeaderHelper.createTasksTitleHeaderView(title: "Featured Lunches:", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 160), color: UIColor.AppColors.backgroundWhite, bottomOffset: 0, topOffset: 40)
            return view
        } else if section == 1 {
            let view = HeaderHelper.createTasksTitleHeaderView(title: "Assignments Due:", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 160), color: UIColor.AppColors.backgroundWhite, bottomOffset: 35, topOffset: 20)
            return view
        } else if section == 2 {
            let view = HeaderHelper.createTasksTitleHeaderView(title: "Today's Events:", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 160), color: UIColor.AppColors.backgroundWhite, bottomOffset: 35, topOffset: -20)
            return view
        }
        
        return nil
    }
}


