//
//  AssignmentsTableCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/22/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class AssignmentsTableCell: UITableViewCell {
    
    
    let frenchAssignments = [Assignment(title: "pg 105-107", dueDate: "Tue, May 27", score: "94/100", grade: "A", classroom: "French"), Assignment(title: "pg 109-111", dueDate: "Wed, May 28", score: "95/100", grade: "A", classroom: "French"), Assignment(title: "pg 115-127", dueDate: "Fri, May 29", score: "93/100", grade: "A", classroom: "French")]

    var assignmentsCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()
    
    
    func setUp(forRow row: Int) {
        setUpCollectionView()
        assignmentsCollectionView?.delegate = self
        assignmentsCollectionView?.dataSource = self
        addConstraints()
        assignmentsCollectionView?.reloadData()
    }
    
    private func addConstraints() {
        assignmentsCollectionView?.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setUpCollectionView() {
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 1
        let collectionViewFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        assignmentsCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        assignmentsCollectionView?.register(AssignmentCollectionCell.self, forCellWithReuseIdentifier: "AssignmentsCollectionCell")
        assignmentsCollectionView?.backgroundColor = UIColor.AppColors.backgroundWhite
        assignmentsCollectionView?.showsHorizontalScrollIndicator = false
        self.addSubview(assignmentsCollectionView!)
        
    }
    

}

extension AssignmentsTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth * 0.8, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return frenchAssignments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssignmentsCollectionCell", for: indexPath) as! AssignmentCollectionCell
        cell.setUp(assignment: frenchAssignments[indexPath.row])
        return cell
    }
    
    
}
