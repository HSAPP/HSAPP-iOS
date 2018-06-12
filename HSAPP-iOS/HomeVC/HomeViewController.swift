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
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CafeteriaCell.self, forCellReuseIdentifier: "cafeteriaCell")
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let viewController = MenuDetailViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cafeteriaCell") as! CafeteriaCell
            cell.setUp(menu: [])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
