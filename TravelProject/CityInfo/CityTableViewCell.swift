//
//  CityTableViewCell.swift
//  TravelProject
//
//  Created by 조우현 on 1/6/25.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    @IBOutlet var explainBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        // 일부만 cornerRadius주기
        cityImageView.layer.cornerRadius = 20
        cityImageView.contentMode = .scaleAspectFill
        explainBackground.layer.cornerRadius = 20
        cityNameLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        cityNameLabel.textColor = .white
        cityExplainLabel.textColor = .white
        cityExplainLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func configureData(row: City) {
        let url = URL(string: row.city_image)
        cityImageView.kf.setImage(with: url)
        cityNameLabel.text = row.title
        cityExplainLabel.text = row.city_explain
    }
}
