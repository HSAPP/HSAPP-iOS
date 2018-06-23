//
//  AssignmentsTableCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/22/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class AssignmentsTableCell: UITableViewCell {

    var assignmentsCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()
    
    
    
    //we're going to pass in the datasource and delegate. So the delegate and datasource is going to come from our viewcontroller, not from our tableview cell
    func setUp
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        setUpCollectionView()
        assignmentsCollectionView?.delegate = dataSourceDelegate
        assignmentsCollectionView?.dataSource = dataSourceDelegate
        assignmentsCollectionView?.tag = row
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
