//
//  InfoTableViewCell.swift
//  TravelProject
//
//  Created by 조우현 on 1/4/25.
//

import UIKit
import Kingfisher

class TravelInfoTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    func configureData(row: Travel) {
        titleLabel.text = row.title
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .magazineTitle
        
        descriptionLabel.text = row.description != nil ? row.description : "불러오기 실패"
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        
        gradeLabel.text = row.grade != nil ? "\(row.grade!) • " : "불러오기 실패 • "
        gradeLabel.font = .systemFont(ofSize: 14, weight: .medium)
        gradeLabel.textColor = .lightGray
        
        saveLabel.text = row.save != nil ? "저장 \(row.save!.numberFormatting()!)" : "불러오기 실패"
        saveLabel.font = .systemFont(ofSize: 14, weight: .medium)
        saveLabel.textColor = .lightGray
        
        if let image = row.travel_image {
            let url = URL(string: image)
            travelImageView.kf.setImage(with: url)
            travelImageView.contentMode = .scaleAspectFill
            travelImageView.layer.cornerRadius = 10
        } else {
            travelImageView.image = UIImage(systemName: "xmark.circle")
            travelImageView.tintColor = .gray
        }
        
        if let button = row.like {
            let name = button ? "heart.fill" : "heart"
            let btnImage = UIImage(systemName: name)
            
            likeButton.setImage(btnImage, for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "questionmark"), for: .normal)
            likeButton.isUserInteractionEnabled = false
        }
    }
}
