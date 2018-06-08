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
        
        self.title = "\(String(describing: classroom?.title))"
        scoreLabel.text = classroom?.score
        setUpNavBar()
        setUpTableView()
        setUpConstraints()
        // Do any additional setup after loading the view.
    }

    func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let p = NSMutableParagraphStyle()
        p.firstLineHeadIndent = 0
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: p]
    }
    
    func setUpConstraints() {
        
        scoreLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.equalToSuperview().offset(-20)
        }
        
        assignmentTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(scoreLabel.snp.bottom)
        }
    }
    
    func setUpTableView() {
        assignmentTableView.delegate = self
        assignmentTableView.dataSource = self
        
        assignmentTableView.register(ClassCell.self, forCellReuseIdentifier: "ClassCell")
        
        self.view.addSubview(assignmentTableView)
        
        
    }
    
    
    //MARK: TABLEVIEW FUNCTIONS
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let assignments = classroom?.assignments else {return 0}
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

}
