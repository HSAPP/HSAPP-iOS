//
//  PersonalViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/22/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class PersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellContent: [(String, UIImage)] = [("My classes", #imageLiteral(resourceName: "classImage")), ("My schedule", #imageLiteral(resourceName: "scheduleImage")), ("My clubs", #imageLiteral(resourceName: "footballImage"))]
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PersonalViewCell.self, forCellReuseIdentifier: "personalViewCell")
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        setUpTableView()
        addSubviews()
        setConstraints()
        
    }
    
    func addSubviews() {
        [tableView].forEach { (view) in
            self.view.addSubview(view)
        }
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    func setUpNavBar() {
        self.title = "Personal"
        self.view.backgroundColor = .white
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController = ClassesViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let viewController = ClubsViewController()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            print("Not connected")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.bounds.height / CGFloat(cellContent.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalViewCell") as! PersonalViewCell
        let title = cellContent[indexPath.row].0
        let image = cellContent[indexPath.row].1
        cell.setUp(title: title, image: image)
        return cell
    }
}
