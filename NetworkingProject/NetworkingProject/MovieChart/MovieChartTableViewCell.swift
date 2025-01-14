//
//  MovieChartTableViewCell.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import UIKit
import SnapKit

class MovieChartTableViewCell: UITableViewCell {
    
    static let identifier = "MovieChartTableViewCell"
    let rankingLabel = UILabel()
    let titleLabel = UILabel()
    let releaseDateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        cellLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        rankingLabel.font = .systemFont(ofSize: 17, weight: .bold)
        rankingLabel.textColor = .black
        rankingLabel.backgroundColor = .white
        rankingLabel.textAlignment = .center
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        
        releaseDateLabel.textColor = .white
        releaseDateLabel.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    private func cellLayout() {
        contentView.addSubview(rankingLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateLabel)
        
        rankingLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(12)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(24)
            make.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalTo(rankingLabel.snp.trailing).offset(12)
            make.width.equalTo(200)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    func configureData(row: BoxOffice.BoxOfficeInfo.Movie) {
        rankingLabel.text = row.rank
        titleLabel.text = row.movieNm
        releaseDateLabel.text = row.openDt
    }
}
