//
//  RestaurantTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var flagButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
    
    func configureUI() {
        restaurantImageView.layer.cornerRadius = 8
        restaurantImageView.layer.masksToBounds = true
        restaurantImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(restaurant: Restaurant, like: Bool) {
        let url = URL(string: restaurant.image)
        restaurantImageView.kf.setImage(with: url)
        titleLabel.text = restaurant.name
        locationLabel.text = restaurant.address
        numberLabel.text = restaurant.phoneNumber
        priceLabel.text = restaurant.price.formatted()
        categoryLabel.text = restaurant.category
        let likeImage = like ? "heart.fill" : "heart"
        let likeColor: UIColor = like ? .darkGray : .systemGray2
        likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        likeButton.tintColor = likeColor
    }
}
