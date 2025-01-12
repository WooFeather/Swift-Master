//
//  LeftBubbleTableViewCell.swift
//  TraverTalk
//
//  Created by 조우현 on 1/11/25.
//

import UIKit

class LeftBubbleTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var bubbleBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        DispatchQueue.main.async { [self] in
            profileImage.layer.cornerRadius = profileImage.frame.width / 2
        }
        messageLabel.numberOfLines = 0
        bubbleBackground.backgroundColor = .clear
        bubbleBackground.layer.cornerRadius = 10
        bubbleBackground.layer.borderWidth = 1
        bubbleBackground.layer.borderColor = UIColor.lightGray.cgColor
        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textColor = .lightGray
    }
    
    func configureData(row: Chat) {
        nameLabel.text = row.user.rawValue
        profileImage.image = UIImage(named: row.user.profileImage)
        messageLabel.text = row.message
        timeLabel.text = row.date.toDate()?.toTimeString()
        print("시간: \(row.date.toDate())")
    }
}
