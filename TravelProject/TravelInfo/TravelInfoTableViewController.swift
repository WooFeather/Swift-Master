//
//  InfoTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/4/25.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    var travels = TravelInfo().travel

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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if travels[indexPath.row].ad == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.travelInfoViewCell.rawValue, for: indexPath) as! TravelInfoTableViewCell
            let row = travels[indexPath.row]
            
            cell.configureData(row: row)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            
            return cell
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: Identifier.travelInfoAdViewCell.rawValue, for: indexPath) as! TravelInfoAdViewCell
            let row = travels[indexPath.row]
            
            adCell.configureData(row: row)
            
            return adCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TravelDetailViewController") as! TravelDetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travels[indexPath.row].ad == false {
            return 164
        } else {
            return 100
        }
    }
}
