//
//  EventDetailViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/7/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class EventDetailViewController: UIViewController {
    
    var event: Event?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 18)
        label.textColor = UIColor.AppColors.lightBlue
        return label
    }()
    
    private var dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Clock")
        return imageView
    }()
    
    private var placeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText-Medium", size: 16)
        return label
    }()
    
    private var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "location")
        return imageView
    }()
    
    func addSubViews() {
        [imageView, placeLabel, placeImageView, dateImageView, dateLabel].forEach { (view) in
            self.view.addSubview(view)
        }
    }
    
    func setConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(self.view.frame.width / 1.62)
        }
        
        dateImageView.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.top).offset(2)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.left.equalTo(dateImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    func setUpNavBar() {
        title = "Hello"
//        navigationController?.navigationBar.prefersLargeTitles = true
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 0
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle]
    }
    
    func setUpViewController(event: Event) {
        self.event = event
        title = event.title
        dateLabel.text = event.date
        placeLabel.text = event.place
//        descriptionLabel.text = event.description
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        setUpNavBar()
        addSubViews()
        setConstraints()
    }
    
}
