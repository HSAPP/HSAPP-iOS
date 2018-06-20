//
//  ClubsViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class ClubsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let clubs = [
        Club(title: "Football", description: "Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice. Football is nice.", leadName: "Cercey Lannister", memberCount: 12, memberLimit: 16, meetingTimes: []),
        Club(title: "Sri Lankan dancing", description: "Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice. Sri Lankan dancing is nice.", leadName: "Jamey Lannister", memberCount: 8, memberLimit: nil, meetingTimes: []),
        Club(title: "Singing", description: "Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice. Singing is nice.", leadName: "Tyrion Lannister", memberCount: 9, memberLimit: 16, meetingTimes: [])]
    
    let clubsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ClubCell.self, forCellReuseIdentifier: "clubCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setContraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavBar()
    }
    
    func setContraints() {
        clubsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    func setUpNavBar() {
        self.view.backgroundColor = .white
        self.title = "Clubs"
        
    }
    
    //    MARK: Table View
    
    func setUpTableView() {
        self.view.addSubview(clubsTableView)
        
        clubsTableView.dataSource = self
        clubsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ClubDetailViewController()
        viewController.setUp(club: clubs[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clubCell") as! ClubCell
        cell.setUp(club: clubs[indexPath.row])
        return cell
    }
}
