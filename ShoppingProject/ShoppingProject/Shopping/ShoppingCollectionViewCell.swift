//
//  ShoppingCollectionViewCell.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit
import SnapKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    static let id = "ShoppingCollectionViewCell"
    let thumbnailImageView = UIImageView()
    let mallNameLabel = UILabel()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(thumbnailImageView)
    }
    
    private func configureLayout() {
        thumbnailImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide).inset(16)
        }
    }
}
