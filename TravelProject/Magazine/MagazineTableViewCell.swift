//
//  MagazineTableViewCell.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    @IBOutlet var magazineImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        
    }
    
    private func configure() {
        
    }
    
    func configureData(row: Magazine) {
        print(#function)
        
        let url = URL(string: row.photo_image)
        magazineImageView.kf.setImage(with: url)
        magazineImageView.contentMode = .scaleAspectFill
        magazineImageView.layer.cornerRadius = 10
        
        titleLabel.text = row.title
        titleLabel.textColor = .magazineTitle
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 0
        
        subtitleLabel.text = row.subtitle
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        subtitleLabel.textColor = .gray
        
        dateLabel.text = row.date.toDate()?.toString() ?? "날짜오류"
        dateLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        dateLabel.textColor = .gray
    }
}
