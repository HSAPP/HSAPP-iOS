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
    var menu = [FoodItem(title: "Hamburger", description: "Beef patty on two buns", price: "$5"), FoodItem(title: "Chicken Salad", description: "lettuce, tomato, egg and chicken strips", price: "$7"), FoodItem(title: "Vegan Patty Burger", description: "patty made from mushrooms, zucchini, and tofu", price: "$7")]
    let frenchAssignments = [Assignment(title: "pg 105-107", dueDate: "Tue, May 27", score: "94/100", grade: "A", classroom: "French"), Assignment(title: "pg 109-111", dueDate: "Wed, May 28", score: "95/100", grade: "A", classroom: "French"), Assignment(title: "pg 115-127", dueDate: "Fri, May 29", score: "93/100", grade: "A", classroom: "French")]
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
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(MenuTableCell.self, forCellReuseIdentifier: "MenuTableCell")
        homeTableView.register(AssignmentsTableCell.self, forCellReuseIdentifier: "AssignmentsTableCell")
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "MenuTableCell") as! MenuTableCell
            cell.setUp(dataSourceDelegate: self, forRow: indexPath.row)
            guard let collectionView = cell.menuCollectionView else {return cell}
            collectionViews.append(collectionView)
            return cell
        } else if indexPath.section == 1 {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "AssignmentsTableCell") as! AssignmentsTableCell
            cell.setUp(dataSourceDelegate: self, forRow: indexPath.row)
            guard let collectionView = cell.assignmentsCollectionView else {return cell}
            collectionViews.append(collectionView)
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
            let view = HeaderHelper.createTasksTitleHeaderView(title: "Featured Lunches:", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 160), color: UIColor.white, bottomOffset: -10)
            return view
        } else if section == 1 {
            let view = HeaderHelper.createTasksTitleHeaderView(title: "Assignments Due:", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 160), color: UIColor.white, bottomOffset: 25)
            return view
        }
        
        return nil
    }
    
    
    
}

extension SunnyHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViews[0] {
            return menu.count
        } else if collectionView == collectionViews[1] {
            return frenchAssignments.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViews[0] {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionCell", for: indexPath) as! MenuCollectionCell
            cell.setUp(menuItem: menu[indexPath.row])
            return cell
            
            
        } else if collectionView == collectionViews[1] {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssignmentsCollectionCell", for: indexPath) as! AssignmentCollectionCell
            cell.setUp(assignment: frenchAssignments[indexPath.row])
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssignmentsCollectionCell", for: indexPath) as! AssignmentCollectionCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViews[0] {
            return CGSize(width: self.view.bounds.width * 0.675, height: 110)
        } else if collectionView == collectionViews[1] {
            return CGSize(width: self.view.bounds.width * 0.8, height: 110)
        }
        return CGSize(width: self.view.bounds.width * 0.9, height: 110)
    }
    
}
