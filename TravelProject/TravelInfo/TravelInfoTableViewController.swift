//
//  InfoTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/4/25.
//

import UIKit
import Kingfisher

class InfoTableViewController: UITableViewController {
    
    var travels = TravelInfo().travel
    let adBackgrounds: [UIColor] = [.adBackground1, .adBackground2, .adBackground3]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        travels[sender.tag].like?.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    // 반복되는 코드 정리해보자
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if travels[indexPath.row].ad == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelInfoTableViewCell", for: indexPath) as! TravelInfoTableViewCell
            let row = travels[indexPath.row]
            
            cell.titleLabel.text = row.title
            cell.titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
            cell.titleLabel.textColor = .magazineTitle
            
            cell.descriptionLabel.text = row.description != nil ? row.description : "불러오기 실패"
            cell.descriptionLabel.font = .systemFont(ofSize: 14, weight: .semibold)
            cell.descriptionLabel.textColor = .gray
            cell.descriptionLabel.numberOfLines = 0
            
            cell.gradeLabel.text = row.grade != nil ? "\(row.grade!) • " : "불러오기 실패 • "
            cell.gradeLabel.font = .systemFont(ofSize: 14, weight: .medium)
            cell.gradeLabel.textColor = .lightGray
            
            cell.saveLabel.text = row.save != nil ? "저장 \(row.save!.numberFormatting()!)" : "불러오기 실패"
            cell.saveLabel.font = .systemFont(ofSize: 14, weight: .medium)
            cell.saveLabel.textColor = .lightGray
            
            if let image = row.travel_image {
                let url = URL(string: image)
                cell.travelImageView.kf.setImage(with: url)
                cell.travelImageView.contentMode = .scaleAspectFill
                cell.travelImageView.layer.cornerRadius = 10
            } else {
                cell.travelImageView.image = UIImage(systemName: "xmark.circle")
                cell.travelImageView.tintColor = .gray
            }
            
            if let button = row.like {
                let name = button ? "heart.fill" : "heart"
                let btnImage = UIImage(systemName: name)
                
                cell.likeButton.setImage(btnImage, for: .normal)
                cell.likeButton.tag = indexPath.row
                cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            } else {
                cell.likeButton.setImage(UIImage(systemName: "questionmark"), for: .normal)
            }
            
            return cell
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "TravelInfoAdViewCell", for: indexPath) as! TravelInfoAdViewCell
            let row = travels[indexPath.row]
            
            // adBackgrounds 배열을 이용하고싶은데... 어떻게 하는게 좋을까요
            adCell.adBackground.backgroundColor = .adBackground1
            adCell.adBackground.layer.cornerRadius = 10
            
            adCell.adTagLabel.text = " AD "
            adCell.adTagLabel.font = .systemFont(ofSize: 14, weight: .medium)
            adCell.adTagLabel.backgroundColor = .white
            adCell.adTagLabel.layer.cornerRadius = 8
            adCell.adTagLabel.clipsToBounds = true
            
            adCell.adTitleLabel.text = row.title
            adCell.adTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
            adCell.adTitleLabel.numberOfLines = 0
            adCell.adTitleLabel.textAlignment = .center
            
            return adCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travels[indexPath.row].ad == false {
            return 164
        } else {
            return 100
        }
    }
}
