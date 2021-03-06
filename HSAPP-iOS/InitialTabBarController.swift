//
//  ViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/6/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class InitialTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        
        let eventsVC = EventsViewController()
        let navOne = UINavigationController(rootViewController: eventsVC)
        
        let tabOneBarItem = UITabBarItem(title: "Events", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        navOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let personalVC = PersonalViewController()
        let navTwo = UINavigationController(rootViewController: personalVC)
        
        let tabTwoBarItem = UITabBarItem(title: "Personal", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        navTwo.tabBarItem = tabTwoBarItem
        
        // Create Tab three
//        let clubsVC = ClubsViewController()
//        let navThree = UINavigationController(rootViewController: clubsVC)
//
//        let tabThreeBarItem = UITabBarItem(title: "Clubs", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
//        navThree.tabBarItem = tabThreeBarItem
        
        // Create Tab four
        let homeVC = SunnyHomeViewController()
        let navFour = UINavigationController(rootViewController: homeVC)
        
        let tabFourBarItem = UITabBarItem(title: "Home", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        navFour.tabBarItem = tabFourBarItem
        
        self.viewControllers = [navFour, navOne, navTwo]
    }


}

