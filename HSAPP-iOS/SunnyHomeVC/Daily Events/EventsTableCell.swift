//
//  EventsTableCell.swift
//  HSAPP-iOS
//
//  Created by Sunny Ouyang on 6/23/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class EventsTableCell: UITableViewCell {

    let eventArray = [Event(title: "Basketball Game", date: "Monday Jan 11, 7:00 PM", place: "Encinal Gym",
                            description: "St. Joseph Men's Varsity Basketball vs Encinal Men's Basketball", price: nil),
                      Event(title: "French food event", date: "Tuesday Jan 12, 9:12 AM", place: "Room 202", description: "Try out different french foods. Don't forget to bring your own. Try out different french foods. Don't forget to bring your own.  Don't forget to bring your own. Try out different french foods. Don't forget to bring your own.", price: 20),
                      Event(title: "Trip to 6 Flags", date: "Saturday Feb 15, 8:00 AM", place: "In front of main hall", description: "One day trip to six flags. Bring signed document from parent.", price: nil)]
    
    var eventsCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()
    
    
    func setUp(forRow row: Int) {
        setUpCollectionView()
        eventsCollectionView?.delegate = self
        eventsCollectionView?.dataSource = self
        addConstraints()
        eventsCollectionView?.reloadData()
    }
    
    private func addConstraints() {
        eventsCollectionView?.snp.makeConstraints { (make) in
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
        eventsCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        eventsCollectionView?.register(EventsCollectionCell.self, forCellWithReuseIdentifier: "EventsCollectionCell")
        eventsCollectionView?.backgroundColor = UIColor.AppColors.backgroundWhite
        eventsCollectionView?.showsHorizontalScrollIndicator = false
        self.addSubview(eventsCollectionView!)
        
    }
    
    
}

extension EventsTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth * 0.8, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCollectionCell", for: indexPath) as! EventsCollectionCell
        cell.setUp(event: eventArray[indexPath.row])
        return cell
    }
}


