//
//  InfoTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/4/25.
//

import UIKit

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
        
        cell.gradeLabel.text = row.grade != nil ? "\(row.grade!) •" : "불러오기 실패 •"
        cell.gradeLabel.font = .systemFont(ofSize: 14, weight: .medium)
        cell.gradeLabel.textColor = .lightGray
        
        cell.saveLabel.text = row.save != nil ? "\(row.save!.numberFormatting()!)" : "불러오기 실패"
        cell.saveLabel.font = .systemFont(ofSize: 14, weight: .medium)
        cell.saveLabel.textColor = .lightGray
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
}
