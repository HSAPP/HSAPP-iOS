//
//  AnnouncementDetailViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/13/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class AnnouncementDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var announcement: Announcement?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "satImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let linksCollectionView: UICollectionView = {
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 16, 0, 16)
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.register(LinkCell.self, forCellWithReuseIdentifier: "linkCell")
        collectionView.backgroundColor = UIColor.AppColors.backgroundWhite
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isDirectionalLockEnabled = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText", size: 14)
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavBar()
        addSubviews()
        setConstraints()
        
        descriptionLabel.text = self.announcement?.description
        linksCollectionView.delegate = self
        linksCollectionView.dataSource = self
    }
    
    func setConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(self.view.bounds.width)
            make.height.equalTo(self.view.bounds.width / 1.62)
        }
        
        linksCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(100)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(linksCollectionView.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func addSubviews() {
        self.view.addSubview(scrollView)
        [imageView, linksCollectionView, descriptionLabel].forEach { (view) in
            self.scrollView.addSubview(view)
        }
    }
    
    func setUpNavBar() {
        self.view.backgroundColor = UIColor.AppColors.backgroundWhite
        self.title = announcement?.title
    }
    
    func setUp(announcement: Announcement) {
        self.announcement = announcement
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return announcement?.links.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "linkCell", for: indexPath) as! LinkCell
        cell.setUp(urlWithTitle: (announcement?.links[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width * 0.4, height: 50)
    }
}
