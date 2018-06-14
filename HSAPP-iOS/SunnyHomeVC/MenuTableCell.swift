//
//  MenuTableCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/14/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {

    
    var menuCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()
    
    
    
    //we're going to pass in the datasource and delegate. So the delegate and datasource is going to come from our viewcontroller, not from our tableview cell
    func setUp
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        setUpCollectionView()
        menuCollectionView?.delegate = dataSourceDelegate
        menuCollectionView?.dataSource = dataSourceDelegate
        menuCollectionView?.tag = row
        addConstraints()
        menuCollectionView?.reloadData()
    }
    
    private func addConstraints() {
        menuCollectionView?.snp.makeConstraints { (make) in
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
        menuCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        menuCollectionView?.register(InProgressAssignmentCell.self, forCellWithReuseIdentifier: "ProgressCollectionCell")
        menuCollectionView?.backgroundColor = UIColor.AppColors.backgroundWhite
        menuCollectionView?.showsHorizontalScrollIndicator = false
        self.addSubview(menuCollectionView!)
        
    }

}
