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
        if section == 0 {
            return 1
        } else {
            return announcements.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "MenuTableCell") as! MenuTableCell
            cell.setUp(dataSourceDelegate: self, forRow: indexPath.row)
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
            let view = HeaderHelper.createTasksTitleHeaderView(title: "Lunch Menu", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 160), color: UIColor.white, bottomOffset: -10)
            return view
        } else {
            return nil
        }
    }
    
    
    
}

extension SunnyHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionCell", for: indexPath) as! MenuCollectionCell
        cell.setUp(menuItem: menu[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width * 0.9, height: 110)
    }
    
}
