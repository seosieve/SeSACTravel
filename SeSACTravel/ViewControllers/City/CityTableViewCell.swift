//
//  CityTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/27/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var starStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
    
    func configureUI() {
        cityImageView.layer.cornerRadius = 8
        cityImageView.layer.masksToBounds = true
        cityImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(_ travel: Travel) {
        titleLabel.text = travel.title
        subTitleLabel.text = travel.description!
        scoreLabel.text = travel.gradeString
        saveLabel.text = travel.saveString
        let url = URL(string: travel.travel_image!)
        cityImageView.kf.setImage(with: url)
        
        let image = travel.like! ? "heart.fill" : "heart"
        let color: UIColor = travel.like! ? .red : .white
        likeButton.setImage(UIImage(systemName: image), for: .normal)
        likeButton.tintColor = color
        
        let grade = Int(floor(travel.grade!))
        for index in 0..<grade {
            guard let starImageView = starStackView.subviews[index] as? UIImageView else { return }
            starImageView.tintColor = .systemYellow
        }
    }
}
