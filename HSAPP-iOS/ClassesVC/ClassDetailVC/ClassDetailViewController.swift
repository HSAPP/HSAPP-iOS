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
        guard let classroom = self.classroom else {return}
        let cdHeaderFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 170)
        let testingCells = [Assignment(title: "pg 200 - 205", dueDate: "Jan 27", score: "N/A", grade: "-"), Assignment(title: "pg 200 - 205", dueDate: "Jan 27", score: "N/A", grade: "-")]
        inProgress = testingCells
        classDetailHeader = CDView(frame: cdHeaderFrame, classroom: classroom)
        
        addSubviews()
        setUpNavBar()
        setUpTableView()
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
    
    func setUpTableView() {
        
        assignmentTableView.backgroundColor = UIColor.AppColors.backgroundWhite
        assignmentTableView.delegate = self
        assignmentTableView.dataSource = self
        assignmentTableView.tableHeaderView = classDetailHeader
        
        assignmentTableView.register(ProgressCell.self, forCellReuseIdentifier: "ProgressCell")
        assignmentTableView.register(AssignmentCell.self, forCellReuseIdentifier: "AssignmentCell")
        
        self.view.addSubview(assignmentTableView)
        
        assignmentTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
    }
    
    
    //MARK: TABLEVIEW FUNCTIONS
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else {
            return 80
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let assignments = classroom?.assignments else {return 0}
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = HeaderHelper.createTasksTitleHeaderView(title: "In Progress", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 150), color: UIColor.AppColors.backgroundWhite, bottomOffset: -10)
            return view
        } else {
            let view = HeaderHelper.createTasksTitleHeaderView(title: "Completed", fontSize: 25, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 150), color: UIColor.AppColors.backgroundWhite, bottomOffset: -20)
            return view
        }
    }
    

}

extension ClassDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: COLLECTIONVIEW FUNCTIONS
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width * 0.9, height: 110)
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
