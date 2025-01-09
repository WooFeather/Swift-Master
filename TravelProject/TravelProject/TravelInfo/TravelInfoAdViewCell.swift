//
//  TravelInfoAdViewCell.swift
//  TravelProject
//
//  Created by 조우현 on 1/5/25.
//

import UIKit

class TravelInfoAdViewCell: UITableViewCell {
    @IBOutlet var adBackground: UIView!
    @IBOutlet var adTagLabel: UILabel!
    @IBOutlet var adTitleLabel: UILabel!
    
    let adBackgrounds: [UIColor] = [.adBackground1, .adBackground2, .adBackground3]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        // 광고 데이터에 배경색에 대한 정보가 없다면 차례대로 배열의 색을 적용하기는 힘들어보여서 일단 random으로 색상을 적용하고 있습니다.
        adBackground.backgroundColor = adBackgrounds.randomElement()
        adBackground.layer.cornerRadius = 10
        adTagLabel.text = " AD "
        adTagLabel.font = .systemFont(ofSize: 14, weight: .medium)
        adTagLabel.backgroundColor = .white
        adTagLabel.layer.cornerRadius = 8
        adTagLabel.clipsToBounds = true
        adTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        adTitleLabel.numberOfLines = 0
        adTitleLabel.textAlignment = .center
    }
    
    func configureData(row: Travel) {
        adTitleLabel.text = row.title
    }
}
