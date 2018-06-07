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
    

    let classesTableView = UITableView()
    let classrooms = [Classroom(title: "French", grade: "A", score: "95/100", assignments: []), Classroom(title: "Calculus", grade: "A", score: "93/100", assignments: []), Classroom(title: "Chemistry", grade: "A", score: "97/100", assignments: []), Classroom(title: "Theatre", grade: "A", score: "96/100", assignments: []), Classroom(title: "P.E", grade: "A", score: "100/100", assignments: [])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "Classrooms"
        setUpNavBar()
        
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let p = NSMutableParagraphStyle()
        p.firstLineHeadIndent = 0
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: p]
    }
    
    //MARK: TABLEVIEW FUNCTIONS
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.classrooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classesTableView.dequeueReusableCell(withIdentifier: "ClassCell") as! ClassCell
        cell.setUp(classroom: self.classrooms[indexPath.row])
        return cell
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
