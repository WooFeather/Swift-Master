//
//  RightBubbleTableViewCell.swift
//  TraverTalk
//
//  Created by 조우현 on 1/12/25.
//

import UIKit

class RightBubbleTableViewCell: UITableViewCell {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var bubbleBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        messageLabel.numberOfLines = 0
        bubbleBackground.backgroundColor = UIColor.systemGray5
        bubbleBackground.layer.cornerRadius = 10
        bubbleBackground.layer.borderWidth = 1
        bubbleBackground.layer.borderColor = UIColor.lightGray.cgColor
        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textColor = .lightGray
    }
    
    func configureData(row: Chat) {
        messageLabel.text = row.message
        timeLabel.text = row.date.toDate()?.toTimeString()
    }
}
