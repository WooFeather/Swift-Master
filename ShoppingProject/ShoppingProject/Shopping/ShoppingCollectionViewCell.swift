//
//  ShoppingCollectionViewCell.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit
import SnapKit

class ShoppingCollectionViewCell: UICollectionViewCell, ViewConfiguration {
    
    static let id = "ShoppingCollectionViewCell"
    
    let thumbnailImageView = UIImageView()
    let mallNameLabel = UILabel()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(mallNameLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
    }
    
    func configureLayout() {
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.centerX.equalTo(snp.centerX)
            make.size.equalTo(180)
        }
        
        mallNameLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(4)
            make.leading.equalTo(self).offset(16)
            make.height.equalTo(17)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mallNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(self).offset(16)
            make.width.equalTo(150)
            make.height.greaterThanOrEqualTo(21)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(self).offset(16)
            make.height.equalTo(21)
        }
    }
    
    func configureView() {
        thumbnailImageView.backgroundColor = .brown
        DispatchQueue.main.async { [self] in
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.width / 8
        }
        
        mallNameLabel.text = "월드캠핑카"
        mallNameLabel.font = .systemFont(ofSize: 12, weight: .medium)
        mallNameLabel.textColor = .gray
        
        titleLabel.text = "국산 캠핑 카라 국산 캠핑 카라국산 캠핑 카라 국산 캠핑 카라 국산 캠핑 카라 국산 캠핑 카라"
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .systemGray3
        titleLabel.numberOfLines = 2
        
        priceLabel.text = 19000000.numberFormatting()
        priceLabel.font = .boldSystemFont(ofSize: 17)
        priceLabel.textColor = .white
    }
}
