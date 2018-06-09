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
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 22)

        return label
    }()
    
    
    var classroom: Classroom?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        guard let title = classroom?.title else {return}
        self.title = "\(title)"
        scoreLabel.text = classroom?.score
        addSubviews()
        setUpNavBar()
        setUpTableView()
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpVC(classroom: Classroom) {
        self.classroom = classroom
        
        
        scoreLabel.text = classroom.score
    }

    func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addSubviews() {
        self.view.addSubview(assignmentTableView)
        self.view.addSubview(scoreLabel)
    }
    
    func setUpConstraints() {
        
        scoreLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.right.equalToSuperview().offset(-20)
        }
        
        assignmentTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(scoreLabel.snp.bottom).offset(10)
        }
    }
    
    func setUpTableView() {
        assignmentTableView.delegate = self
        assignmentTableView.dataSource = self
        
        
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
