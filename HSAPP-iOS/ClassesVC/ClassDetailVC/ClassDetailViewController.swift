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
    var inProgress: [Assignment]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        guard let classroom = self.classroom else {return}
        let cdHeaderFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 165)
        guard let first = classroom.assignments.first else {return}
        let testingCells = [Assignment(title: "pg 200 - 205", dueDate: "Jan 27", score: "N/A", grade: "-"), Assignment(title: "pg 200 - 205", dueDate: "Jan 27", score: "N/A", grade: "-")]
        inProgress = testingCells
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
        
        assignmentTableView.register(ProgressCell.self, forCellReuseIdentifier: "ProgressCell")
        assignmentTableView.register(AssignmentCell.self, forCellReuseIdentifier: "AssignmentCell")
        
        self.view.addSubview(assignmentTableView)
        
        
    }
    
    
    //MARK: TABLEVIEW FUNCTIONS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let assignments = classroom?.assignments else {return 0}
        guard let inProgressAssignments = inProgress else {return 0}
        
        if section == 0 {
            return 1
        } else {
            return assignments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = assignmentTableView.dequeueReusableCell(withIdentifier: "ProgressCell") as! ProgressCell
            cell.setUp(dataSourceDelegate: self, forRow: indexPath.row)
            return cell
        } else {
            let cell = assignmentTableView.dequeueReusableCell(withIdentifier: "AssignmentCell") as! AssignmentCell
            guard let classroom = classroom else {return cell}
            cell.setUp(assignment: classroom.assignments[indexPath.row])
            return cell
        }
        
    }
    

}

extension ClassDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let inProgress = self.inProgress else {return 0}
        return inProgress.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCollectionCell", for: indexPath) as! InProgressAssignmentCell
        guard let inProgress = self.inProgress else {return cell}
        cell.setUp(assignment: inProgress[indexPath.row])
        return cell
    }
    
    
}
