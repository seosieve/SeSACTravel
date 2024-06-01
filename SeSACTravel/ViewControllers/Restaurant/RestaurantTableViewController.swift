//
//  RestaurantTableViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewController: UITableViewController {
    
    @IBOutlet var restaurantContainerView: UIView!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var textField: UITextField!
    
    var restaurantArray: [Restaurant] = RestaurantList.restaurantArray {
        didSet { tableView.reloadData() }
    }
    
    lazy var likeArr = Array(repeating: false, count: restaurantArray.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        restaurantContainerView.layer.cornerRadius = 8
        searchButton.layer.cornerRadius = 4
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        searchLogic()
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchLogic()
    }
    
    func searchLogic() {
        restaurantArray = RestaurantList.restaurantArray
        guard let text = textField.text, !text.isEmpty else { return }
        
        if let maxPrice = Int(text) {
            restaurantArray = restaurantArray.filter{ $0.price <= maxPrice }
        } else {
            restaurantArray = restaurantArray.filter{ $0.category.contains(text) }
        }
    }
}

//MARK: - TableView
extension RestaurantTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let restaurant = restaurantArray[indexPath.row]
        if restaurant.address.count < 27 {
            return 400
        } else {
            return 420
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurantArray[indexPath.row]
        let like = likeArr[indexPath.row]
        let identifier = RestaurantTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RestaurantTableViewCell
        cell.configureCell(restaurant: restaurant, like: like)
        cell.likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        cell.flagButton.addTarget(self, action: #selector(flagButtonPressed), for: .touchUpInside)
        cell.shareButton.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonPressed(_ sender: UIButton) {
        let hitPoint = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: hitPoint) else { return }
        likeArr[indexPath.row].toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @objc func flagButtonPressed(_ sender: UIButton) {
        
    }
    
    @objc func shareButtonPressed(_ sender: UIButton) {
        
    }
}
