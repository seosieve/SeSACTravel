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
        subtitleView.backgroundColor = .black.withAlphaComponent(0.6)
    }
    
    func configureCell(city: City, targetText: String) {
        subtitleLabel.attributedText = highlighted(city.city_explain, targetText)
        titleLabel.attributedText = highlighted(city.city_title, targetText)
        let url = URL(string: city.city_image)
        containerImageView.kf.setImage(with: url)
    }
    
    func highlighted(_ originalString: String, _ changingString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: originalString)
        let value = UIColor.blue
        attrStr.addAttribute(.foregroundColor, value: value, range: (originalString as NSString).range(of: changingString))
        return attrStr
    }
}
