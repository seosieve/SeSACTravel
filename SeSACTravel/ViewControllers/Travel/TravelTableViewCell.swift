//
//  TravelTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var travelTitleLabel: UILabel!
    @IBOutlet var travelSubtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
    
    func configureUI() {
        travelImageView.layer.masksToBounds = true
        travelImageView.layer.cornerRadius = 12
        travelImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(_ magazine: Magazine) {
        let url = URL(string: magazine.photo_image)
        travelImageView.kf.setImage(with: url)
        travelTitleLabel.text = magazine.title
        travelSubtitleLabel.text = magazine.subtitle
        dateLabel.text = magazine.formattedDate
    }
}
