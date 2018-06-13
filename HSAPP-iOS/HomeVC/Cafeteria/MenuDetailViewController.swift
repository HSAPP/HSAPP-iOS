//
//  MenuDetailViewController.swift
//  HSAPP-iOS
//
//  Created by Tony Cioara on 6/11/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class MenuDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menu = [MenuItem(price: 8, title: "Hamburger", ingredientList: ["Ground beef", "Bun", "Pickles", "Mayo", "Ketchup"], isVegetarian: false, isGlutenFree: false, isVegan: false),
                MenuItem(price: 6, title: "Veggie Buritto", ingredientList: ["Beans", "Letuce", "Tomatoes", "Pickles", "Spinach wrap"], isVegetarian: true, isGlutenFree: true, isVegan: true),
                MenuItem(price: 4, title: "Breakfast club", ingredientList: ["Bagel", "Eggs", "Bacon", "Avocado"], isVegetarian: false, isGlutenFree: false, isVegan: false)]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: "menuItemCell")
        return tableView
    }()
    
    @objc func clickedNavBarRightItem(sender: UIBarButtonItem) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    let alertController: UIAlertController = {
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let filterView = MenuFilterView(frame: CGRect(x: 10, y: 10, width: alertController.view.bounds.width - 40, height: 120))
        filterView.setUp()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction!) in
            print("cancel")
        })
        
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: { (alert: UIAlertAction!) in
            print("cancel")
        })
        
        alertController.view.addSubview(filterView)
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        addSubviews()
        setConstraints()
        setUpTableview()
    }
    
    func setUpNavBar() {
        self.title = "Cafeteria Menu"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(clickedNavBarRightItem(sender:)))
    }
    
    func addSubviews() {
        [tableView].forEach { (view) in
            self.view.addSubview(view)
        }
    }
    
    func setUpTableview() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell") as! MenuItemCell
        cell.setUp(menuItem: menu[indexPath.row])
        return cell
    }
    
    
}
