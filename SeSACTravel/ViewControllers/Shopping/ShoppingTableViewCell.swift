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
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
    
    func configureUI() {
        containerView.layer.cornerRadius = 8
    }
    
    func configureCell(shopping: Shopping) {
        titleLable.text = shopping.title
        let checkButtonName = shopping.finished ? "checkmark.square.fill" : "checkmark.square"
        checkButton.setImage(UIImage(systemName: checkButtonName), for: .normal)
        let favoredButtonName = shopping.favorited ? "star.fill" : "star"
        favoredButton.setImage(UIImage(systemName: favoredButtonName), for: .normal)
    }
}
