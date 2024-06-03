//
//  MyBubbleTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 6/3/24.
//

import UIKit

class MyBubbleTableViewCell: UITableViewCell {
    
    @IBOutlet var dayView: UIView!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func configureUI() {
        dayView.layer.cornerRadius = 11
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.gray.cgColor
        contentLabel.textColor = .darkGray
    }
    
    func configureCell(chat: Chat) {
        dayLabel.text = ""
        dayView.isHidden = true
        contentLabel.text = chat.message
        timeLabel.text = chat.chatDate
    }
    
    func configureDayView(chat: Chat) {
        dayLabel.text = chat.viewDate
        dayView.isHidden = false
    }
}
