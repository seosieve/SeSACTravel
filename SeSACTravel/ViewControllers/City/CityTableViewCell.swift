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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve) {
                self.setSelected(false, animated: animated)
            }
        }
    }
    
    func configureUI() {
        cityImageView.layer.cornerRadius = 8
        cityImageView.layer.masksToBounds = true
        cityImageView.contentMode = .scaleAspectFill
    }
    
}
