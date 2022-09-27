//
//  RestaurantMenuViewController.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import UIKit

class RestaurantMenuViewController: UIViewController, RestaurantMenuViewProtocol {
    @IBOutlet var tableView: UITableView!
    
    var presenter: RestaurantMenuPresenterProtocol?
    var menu: RestaurantMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
        setupTableView()
        presenter?.fetchMenu()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "RestaurantMenuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RestaurantMenuTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
    
    func update(with menu: RestaurantMenu) {
        DispatchQueue.main.async {
            self.tableView.isHidden = false
            self.menu = menu
            self.tableView.reloadData()
        }
    }
    
    func update(with error: APIError) {
        tableView.isHidden = true
    }
}

extension RestaurantMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu?.menuItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantMenuTableViewCell") as? RestaurantMenuTableViewCell else { return UITableViewCell() }
        if let restaurantMenu = menu?.menuItems[indexPath.row] {
            cell.configure(with: restaurantMenu)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ViewWithLabel.fromNib()
        headerView.backgroundColor = .clear
        headerView.titleLabel.text = menu?.name
        return headerView
    }
}
