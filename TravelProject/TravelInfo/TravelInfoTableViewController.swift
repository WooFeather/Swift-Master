//
//  InfoTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/4/25.
//

import UIKit
import Kingfisher

class InfoTableViewController: UITableViewController {
    
    let travels = TravelInfo().travel

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
        
        let image = row.travel_image
        
        if let image {
            let url = URL(string: image)
            cell.travelImageView.kf.setImage(with: url)
            cell.travelImageView.contentMode = .scaleAspectFill
            cell.travelImageView.layer.cornerRadius = 10
        } else {
            cell.travelImageView.image = UIImage(systemName: "xmark.circle")
            cell.travelImageView.tintColor = .gray
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
}
