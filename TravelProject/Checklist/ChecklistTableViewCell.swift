//
//  ChecklistTableViewCell.swift
//  TravelProject
//
//  Created by 조우현 on 1/5/25.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {
    @IBOutlet var completeButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bookmarkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .cellBackground
    }
    
    func configureData(row: Checklist) {
        titleLabel.setChecklistCellLabel(row.title ?? "불러오기 실패")
        completeButton.setImage(UIImage(systemName: row.complete ? "checkmark.square.fill" : "checkmark.square"), for: .normal)
        bookmarkButton.setImage(UIImage(systemName: row.bookmark ? "star.fill" : "star"), for: .normal)
    }
}
