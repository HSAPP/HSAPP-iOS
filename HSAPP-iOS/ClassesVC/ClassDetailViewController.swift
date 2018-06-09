//
//  ClassDetailViewController.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    let assignmentTableView = UITableView()
    var classDetailHeader: CDView?
    
    
    
    var classroom: Classroom?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        guard let classroom = self.classroom else {return}
        let cdHeaderFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 165)
        
        classDetailHeader = CDView(frame: cdHeaderFrame, classroom: classroom)
        
        addSubviews()
        setUpNavBar()
        setUpTableView()
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpVC(classroom: Classroom) {
        self.classroom = classroom
        
    }

    func setUpNavBar() {
        guard let title = classroom?.title else {return}
        self.title = "\(title)"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addSubviews() {
        self.view.addSubview(assignmentTableView)

    }
    
    func setUpConstraints() {
        
        
        assignmentTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    func setUpTableView() {
        
        assignmentTableView.delegate = self
        assignmentTableView.dataSource = self
        assignmentTableView.tableHeaderView = classDetailHeader
        
        assignmentTableView.register(AssignmentCell.self, forCellReuseIdentifier: "AssignmentCell")
        
        self.view.addSubview(assignmentTableView)
        
        
    }
    
    
    //MARK: TABLEVIEW FUNCTIONS
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let assignments = classroom?.assignments else {return 0}
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assignmentTableView.dequeueReusableCell(withIdentifier: "AssignmentCell") as! AssignmentCell
        guard let classroom = classroom else {return cell}
        cell.setUp(assignment: classroom.assignments[indexPath.row])
        return cell
    }
    

}
