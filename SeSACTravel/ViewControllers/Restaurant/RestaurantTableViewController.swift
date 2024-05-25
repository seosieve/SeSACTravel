//
//  RestaurantTableViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    @IBOutlet var restaurantContainerView: UIView!
    @IBOutlet var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        tableView.rowHeight = 400
    }
    
    func setViews() {
        restaurantContainerView.layer.cornerRadius = 8
        searchButton.layer.cornerRadius = 4
    }
}

extension RestaurantTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CellIdentifier.restaurantViewCell.description
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.restaurantImageView.layer.cornerRadius = 8
        cell.restaurantImageView.layer.masksToBounds = true
        cell.restaurantImageView.contentMode = .scaleAspectFill
        
        return cell
    }
}
