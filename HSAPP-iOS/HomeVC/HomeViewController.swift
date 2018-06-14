//
//  HomeViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/11/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let announcements = [Announcement(description: "It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future. It is important for your future.", title: "Sign up for SATs", links: [URLWithTitle(URL: URL(fileURLWithPath: ""), title: "Sign Up"), URLWithTitle(URL: URL(fileURLWithPath: ""), title: "More info"), URLWithTitle(URL: URL(fileURLWithPath: ""), title: "Contact support")])]
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CafeteriaCell.self, forCellReuseIdentifier: "cafeteriaCell")
        tableView.register(AnnouncementCell.self, forCellReuseIdentifier: "announcementCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    func setContraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpNavBar()
        setContraints()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func setUpNavBar() {
        self.view.backgroundColor = .white
        self.title = "Home"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + announcements.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let viewController = MenuDetailViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let viewController = AnnouncementDetailViewController()
            viewController.setUp(announcement: announcements[indexPath.row - 1])
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cafeteriaCell") as! CafeteriaCell
            cell.setUp(menu: [])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "announcementCell") as! AnnouncementCell
            cell.setUp(announcement: announcements[indexPath.row - 1])
            return cell
        }
    }
}
