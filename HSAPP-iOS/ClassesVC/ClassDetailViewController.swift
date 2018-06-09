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
    
    let teacherImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Sunny"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let teacherNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 18)
        
        return label
    }()
    
    let gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Bold", size: 24)

        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-SemiBold", size: 18)
        label.textColor = UIColor.darkGray

        return label
    }()
    
    
    var classroom: Classroom?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        gradeLabel.text = "A"
        scoreLabel.text = classroom?.score
        teacherNameLabel.text = "S. Ouyang"
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
        guard let title = classroom?.title else {return}
        self.title = "\(title)"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addSubviews() {
        self.view.addSubview(teacherImage)
        self.view.addSubview(teacherNameLabel)
        self.view.addSubview(assignmentTableView)
        self.view.addSubview(scoreLabel)
        self.view.addSubview(gradeLabel)
    }
    
    func setUpConstraints() {
        
        
        teacherImage.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        teacherNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(teacherImage.snp.right).offset(2)
        }
        
        gradeLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(teacherImage.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(gradeLabel.snp.bottom).offset(4)
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
