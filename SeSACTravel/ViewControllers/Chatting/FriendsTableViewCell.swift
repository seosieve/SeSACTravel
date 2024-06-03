//
//  FriendsTableViewCell.swift
//  SeSACTravel
//
//  Created by 서충원 on 6/1/24.
//

import UIKit

enum ChatRoomStyle {
    case single
    case multi
    
    var thumbnailStyle: Bool {
        return self == .single ? false : true
    }
}

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var multiThumbnailView: UIView!
    @IBOutlet var firstMultiThumbnail: UIImageView!
    @IBOutlet var secondMultiThumbnail: UIImageView!
    @IBOutlet var thirdMultiThumbnail: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var subscriptLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for thumbnail in [thumbnailImageView, firstMultiThumbnail, secondMultiThumbnail, thirdMultiThumbnail].compactMap({$0}) {
            thumbnail.layer.cornerRadius = thumbnail.bounds.height/2
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
    
    func configureUI() {
        for thumbnail in [firstMultiThumbnail, secondMultiThumbnail, thirdMultiThumbnail].compactMap({$0}) {
            thumbnail.backgroundColor = .systemGray6
            thumbnail.contentMode = .scaleAspectFill
            thumbnail.layer.masksToBounds = true
            thumbnail.layer.borderColor = UIColor.white.cgColor
            thumbnail.layer.borderWidth = 2
        }
        
        thumbnailImageView.backgroundColor = .systemGray6
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.layer.masksToBounds = true
    }
    
    func configureCell(chat: ChatRoom) {
        let style: ChatRoomStyle = chat.chatroomImage.count == 1 ? .single : .multi
        thumbnailImageView.isHidden = style.thumbnailStyle
        multiThumbnailView.isHidden = !style.thumbnailStyle
        
        switch style {
        case .single:
            thumbnailImageView.image = chat.chatroomImage[0]
        case .multi:
            firstMultiThumbnail.image = chat.chatroomImage[0]
            secondMultiThumbnail.image = chat.chatroomImage[1]
            thirdMultiThumbnail.image = chat.chatroomImage[2]
        }
        
        nicknameLabel.text = chat.chatroomName
        subscriptLabel.text = chat.chatList.last?.message
        timeLabel.text = chat.chatList.last?.previewDate
    }
}
