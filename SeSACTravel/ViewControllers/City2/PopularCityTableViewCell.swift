//
//  PopularCityTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/29/24.
//

import UIKit
import Kingfisher

class PopularCityTableViewCell: UITableViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var containerImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleView: UIView!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
    
    func configureUI() {
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 40
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        containerImageView.contentMode = .scaleAspectFill
        
        subtitleView.backgroundColor = .darkGray.withAlphaComponent(0.8)
    }
    
    func configureCell(city: City) {
        titleLabel.text = city.city_title
        
        let url = URL(string: city.city_image)
        containerImageView.kf.setImage(with: url)
        
        subtitleLabel.text = city.city_explain
    }
}
