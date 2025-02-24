//
//  GameCollectionViewCell.swift
//  UpDownGame
//
//  Created by 조우현 on 1/9/25.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {

    static let identifier = "GameCollectionViewCell"
    
    @IBOutlet var cellBackground: UIView!
    @IBOutlet var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                cellBackground.backgroundColor = .black
                numberLabel.textColor = .white
            } else {
                cellBackground.backgroundColor = .white
                numberLabel.textColor = .black
            }
        }
    }
}
