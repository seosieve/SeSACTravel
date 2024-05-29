//
//  ShoppingTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/24/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var favoredButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
}
