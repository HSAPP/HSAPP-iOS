//
//  EventsViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/6/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let eventsTableView = UITableView()
    
    let eventArray = [Event(title: "Basketball Game", date: "Monday Jan 11, 7:00 PM", place: "Encinal Gym",
                            description: "St. Joseph Men's Varsity Basketball vs Encinal Men's Basketball"),
                      Event(title: "French food event", date: "Tuesday Jan 12, 9:12 AM", place: "Room 202", description: "Try out different french foods. Don't forget to bring your own. ry out different french foods. Don't forget to bring your own. ry out different french foods. Don't forget to bring your own."),
                      Event(title: "Trip to 6 Flags", date: "Saturday Feb 15, 8:00 AM", place: "In front of main hall", description: "One day trip to six flags. Bring signed document from parent.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavBar()
    }
    
    //    MARK: Navigation Bar
    
    func setUpNavBar() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Events"
        self.view.backgroundColor = .white
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = 25
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle]
    }
    
    //    MARK: Table View
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        cell.setUp(event: self.eventArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = EventDetailViewController()
        viewController.setUpViewController(event: self.eventArray[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setUpTableView() {
        eventsTableView.register(EventCell.self, forCellReuseIdentifier: "eventCell")
        
        //We need to add the tableview to our view before we constrain it with snapkit
        self.view.addSubview(eventsTableView)
        
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        eventsTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
}
