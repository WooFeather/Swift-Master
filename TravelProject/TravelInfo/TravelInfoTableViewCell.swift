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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        travelImageView.image = UIImage(systemName: "xmark.circle")
        likeButton.setImage(UIImage(systemName: "questionmark"), for: .normal)
    }
    
    // 추가로 해볼것: 이 안에서도 분리해보기
    private func configure() {
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .magazineTitle
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        gradeLabel.font = .systemFont(ofSize: 14, weight: .medium)
        gradeLabel.textColor = .lightGray
        saveLabel.font = .systemFont(ofSize: 14, weight: .medium)
        saveLabel.textColor = .lightGray
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 10
        travelImageView.tintColor = .gray
        travelImageView.image = UIImage(systemName: "xmark.circle")
        likeButton.setImage(UIImage(systemName: "questionmark"), for: .normal)
    }
    
    // 추가로 해볼것: 옵셔널 처리 연산속성으로 빼보기
    func configureData(row: Travel) {
        titleLabel.text = row.title
        descriptionLabel.text = row.description != nil ? row.description : "불러오기 실패"
        gradeLabel.text = row.grade != nil ? "\(row.grade!) • " : "불러오기 실패 • "
        saveLabel.text = row.save != nil ? "저장 \(row.save!.numberFormatting()!)" : "불러오기 실패"
        
        if let image = row.travel_image {
            let url = URL(string: image)
            travelImageView.kf.setImage(with: url)
        }
        
        if let button = row.like {
            let name = button ? "heart.fill" : "heart"
            let btnImage = UIImage(systemName: name)
            likeButton.setImage(btnImage, for: .normal)
        } else {
            likeButton.isUserInteractionEnabled = false
        }
    }
}
