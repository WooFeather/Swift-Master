//
//  CityInfoCollectionViewCell.swift
//  TravelProject
//
//  Created by 조우현 on 1/7/25.
//

import UIKit
import Kingfisher

class CityInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        // 일부만 cornerRadius주기
        cityImageView.layer.cornerRadius = 80
        cityImageView.contentMode = .scaleAspectFill
        cityNameLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        cityNameLabel.textColor = .black
        cityNameLabel.textAlignment = .center
        cityExplainLabel.textColor = .lightGray
        cityExplainLabel.font = .systemFont(ofSize: 12, weight: .medium)
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.textAlignment = .center
    }
    
    func configureData(item: City) {
        let url = URL(string: item.city_image)
        cityImageView.kf.setImage(with: url)
        cityNameLabel.text = item.title
        cityExplainLabel.text = item.city_explain
    }
}
