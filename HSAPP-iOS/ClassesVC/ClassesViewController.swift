//
//  ClassesViewController.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/7/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class ClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let frenchAssignments = [Assignment(title: "pg 105-107", dueDate: "Tue, May 27", score: "94/100", grade: "A", classroom: "French"), Assignment(title: "pg 109-111", dueDate: "Wed, May 28", score: "95/100", grade: "A", classroom: "French"), Assignment(title: "pg 115-127", dueDate: "Fri, May 29", score: "93/100", grade: "A", classroom: "French"), Assignment(title: "pg 125-127", dueDate: "Mon, June 4", score: "94/100", grade: "A", classroom: "French"), Assignment(title: "pg 135-137", dueDate: "Tue, May 27", score: "94/100", grade: "A", classroom: "French"), Assignment(title: "pg 140-147", dueDate: "Tue, May 27", score: "94/100", grade: "A", classroom: "French")]

    let classesTableView = UITableView()
    var classrooms: [Classroom]?
    var selectedIndex: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classrooms = [Classroom(title: "French", grade: "A", score: "95/100", assignments: frenchAssignments), Classroom(title: "Calculus", grade: "A", score: "93/100", assignments: frenchAssignments), Classroom(title: "Chemistry", grade: "A", score: "97/100", assignments: frenchAssignments), Classroom(title: "Theatre", grade: "A", score: "96/100", assignments: frenchAssignments), Classroom(title: "P.E", grade: "A", score: "100/100", assignments: frenchAssignments)]
        
        self.view.backgroundColor = UIColor.AppColors.backgroundWhite
        self.title = "Classrooms"
        setUpNavBar()
        
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let index = selectedIndex else {return}
        self.classesTableView.deselectRow(at: index, animated: animated)
    }
    
    
    func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let p = NSMutableParagraphStyle()
        p.firstLineHeadIndent = 0
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: p]
    }
    
    //MARK: TABLEVIEW FUNCTIONS
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let classrooms = self.classrooms else {return 0}
        return classrooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classesTableView.dequeueReusableCell(withIdentifier: "ClassCell") as! ClassCell
        guard let classrooms = self.classrooms else {return cell}
        cell.setUp(classroom: classrooms[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ClassDetailViewController()
        
        guard let classrooms = self.classrooms else {return}
        
        viewController.setUpVC(classroom: classrooms[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
        self.selectedIndex = indexPath
    }
    

    func setUpTableView() {
        classesTableView.delegate = self
        classesTableView.dataSource = self
        
        classesTableView.register(ClassCell.self, forCellReuseIdentifier: "ClassCell")
        
        self.view.addSubview(classesTableView)
        
        classesTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
}


