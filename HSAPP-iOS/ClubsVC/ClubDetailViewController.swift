//
//  ClubDetailViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/9/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ClubDetailViewController: UIViewController {
    
    var club: Club?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
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
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.width / 1.62)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func addSubviews() {
        self.view.addSubview(scrollView)
        [imageView, descriptionLabel].forEach { (view) in
            self.scrollView.addSubview(view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        addSubviews()
        setConstraints()
    }
    
    func setUp(club: Club) {
        self.club = club
        self.descriptionLabel.text = club.description
    }
    
    func setUpNavBar() {
        self.title = club?.title
        self.view.backgroundColor = .white
    }
    
    
    
}
