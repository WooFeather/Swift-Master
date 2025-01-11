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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        messageLabel.numberOfLines = 0
        timeLabel.font = .systemFont(ofSize: 14)
    }
    
    func configureData() {
        
    }
}
