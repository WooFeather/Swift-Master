//
//  GroupChatCollectionViewCell.swift
//  TraverTalk
//
//  Created by 조우현 on 1/12/25.
//

import UIKit

class GroupChatCollectionViewCell: UICollectionViewCell {

    @IBOutlet var groupChatImage1: UIImageView!
    @IBOutlet var groupChatImage2: UIImageView!
    @IBOutlet var groupChatImage3: UIImageView!
    @IBOutlet var groupChatImage4: UIImageView!
    
    @IBOutlet var groupChatTitleLabel: UILabel!
    @IBOutlet var groupChatPreviewLabel: UILabel!
    @IBOutlet var groupChatDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        DispatchQueue.main.async { [self] in
            groupChatImage1.layer.cornerRadius = groupChatImage1.frame.width / 2
            groupChatImage2.layer.cornerRadius = groupChatImage2.frame.width / 2
            groupChatImage3.layer.cornerRadius = groupChatImage3.frame.width / 2
            groupChatImage4.layer.cornerRadius = groupChatImage4.frame.width / 2
        }
        groupChatTitleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        groupChatTitleLabel.textColor = .title
        groupChatPreviewLabel.textColor = .preview
        groupChatDateLabel.font = .systemFont(ofSize: 14)
        groupChatDateLabel.textColor = .lightGray
    }
    
    func configureData(item: ChatRoom) {
        groupChatImage1.image = UIImage(named: item.chatroomImage[0])
        groupChatImage2.image = UIImage(named: item.chatroomImage[1])
        groupChatImage3.image = UIImage(named: item.chatroomImage[2])
        groupChatImage4.image = UIImage(named: item.chatroomImage[3])
        
        groupChatTitleLabel.text = item.chatroomName
        groupChatPreviewLabel.text = item.chatList.last?.message
        groupChatDateLabel.text = item.chatList.last?.date.toDate()?.toString()
    }
}
