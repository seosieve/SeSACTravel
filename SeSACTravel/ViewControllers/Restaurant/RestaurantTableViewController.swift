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
    
    let originalArray = RestaurantList().restaurantArray
    var restaurantArray = RestaurantList().restaurantArray
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
        guard let text = textField.text else { return }
        if text.isEmpty {
            restaurantArray = originalArray
            tableView.reloadData()
        } else {
            //문자일때
            if Int(text) == nil {
                restaurantArray = []
                for item in originalArray {
                    if item.category.contains(text) {
                        restaurantArray.append(item)
                    }
                }
                tableView.reloadData()
                print("aa")
            } else {
                //숫자일때
                restaurantArray = []
                for item in originalArray {
                    if item.price <= Int(text)! {
                        restaurantArray.append(item)
                    }
                }
                tableView.reloadData()
                print("bb")
            }
        }
    }
}

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
        let identifier = CellIdentifier.restaurantViewCell.description
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RestaurantTableViewCell
        
        
        let url = URL(string: restaurant.image)
        cell.restaurantImageView.kf.setImage(with: url)
        cell.restaurantImageView.layer.cornerRadius = 8
        cell.restaurantImageView.layer.masksToBounds = true
        cell.restaurantImageView.contentMode = .scaleAspectFill
        
        cell.titleLabel.text = restaurant.name
        cell.locationLabel.text = restaurant.address
        cell.numberLabel.text = restaurant.phoneNumber
        cell.priceLabel.text = restaurant.price.formatted()
        cell.categoryLabel.text = restaurant.category
        
        let likeImage = likeArr[indexPath.row] ? "heart.fill" : "heart"
        let likeColor: UIColor = likeArr[indexPath.row] ? .darkGray : .systemGray2
        cell.likeButton.tag = indexPath.row
        cell.likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        cell.likeButton.tintColor = likeColor
        cell.likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        
        cell.flagButton.addTarget(self, action: #selector(flagButtonPressed), for: .touchUpInside)
        
        cell.shareButton.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonPressed(_ sender: UIButton) {
        likeArr[sender.tag].toggle()
        tableView.reloadData()
    }
    
    @objc func flagButtonPressed(_ sender: UIButton) {
        
    }
    
    @objc func shareButtonPressed(_ sender: UIButton) {
        
    }
}
