//
//  AdTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/28/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    @IBOutlet var adBackgroundView: UIView!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adTitleLabel: UILabel!
    
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
        adBackgroundView.backgroundColor = UIColor.randomColor
        adBackgroundView.layer.cornerRadius = 8
        adLabel.layer.masksToBounds = true
        adLabel.layer.cornerRadius = 8
    }
    
    func configureCell(_ travel: Travel) {
        adTitleLabel.text = travel.title
    }
}
