//
//  ChatListCollectionViewCell.swift
//  TraverTalk
//
//  Created by 조우현 on 1/10/25.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    @IBOutlet var chatRoomImage: UIImageView!
    @IBOutlet var chatRoomTitleLabel: UILabel!
    @IBOutlet var chatRoomPreviewLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        DispatchQueue.main.async { [self] in
            chatRoomImage.layer.cornerRadius = chatRoomImage.frame.width / 2
        }
        chatRoomTitleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        chatRoomTitleLabel.textColor = .title
        chatRoomPreviewLabel.textColor = .preview
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .lightGray
    }
    
    func configureData(item: ChatRoom) {
        chatRoomImage.image = UIImage(named: item.chatroomImage.first ?? "")
        chatRoomTitleLabel.text = item.chatroomName
        chatRoomPreviewLabel.text = item.chatList.last?.message
        dateLabel.text = item.chatList.last?.date.toDate()?.toString()
    }
}
