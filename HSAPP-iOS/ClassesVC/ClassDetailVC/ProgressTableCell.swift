//
//  ProgressCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/10/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ProgressCell: UITableViewCell {
    
    var assignmentCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()
    
    
    
    //we're going to pass in the datasource and delegate. So the delegate and datasource is going to come from our viewcontroller, not from our tableview cell
    func setUp
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        setUpCollectionView()
        assignmentCollectionView?.delegate = dataSourceDelegate
        assignmentCollectionView?.dataSource = dataSourceDelegate
        assignmentCollectionView?.tag = row
        addConstraints()
        assignmentCollectionView?.reloadData()
    }
    
    private func addConstraints() {
        assignmentCollectionView?.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setUpCollectionView() {
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        let collectionViewFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        assignmentCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        assignmentCollectionView?.register(InProgressAssignmentCell.self, forCellWithReuseIdentifier: "ProgressCollectionCell")
        assignmentCollectionView?.backgroundColor = UIColor(red: 226/255, green: 228/255, blue: 233/255, alpha: 1)
        assignmentCollectionView?.showsHorizontalScrollIndicator = false
        self.addSubview(assignmentCollectionView!)
        
    }
    
}

