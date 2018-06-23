//
//  MenuTableCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/14/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {

    
    var menu = [FoodItem(title: "Hamburger", description: "Beef patty on two buns", price: "$5"), FoodItem(title: "Chicken Salad", description: "lettuce, tomato, egg and chicken strips", price: "$7"), FoodItem(title: "Vegan Patty Burger", description: "patty made from mushrooms, zucchini, and tofu", price: "$7")]
    
    var menuCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()
    
    
    func setUp(forRow row: Int) {
        setUpCollectionView()
        menuCollectionView?.delegate = self
        menuCollectionView?.dataSource = self
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
        menuCollectionView?.register(MenuCollectionCell.self, forCellWithReuseIdentifier: "MenuCollectionCell")
        menuCollectionView?.backgroundColor = UIColor.AppColors.backgroundWhite
        menuCollectionView?.showsHorizontalScrollIndicator = false
        self.addSubview(menuCollectionView!)
        
    }

}

extension MenuTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth * 0.9, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionCell", for: indexPath) as! MenuCollectionCell
        cell.setUp(menuItem: menu[indexPath.row])
        return cell
    }
    
    
}
