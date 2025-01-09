//
//  MagazineTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit

class MagazineTableViewController: UITableViewController {

    var magazines = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.magazineTableViewCell.rawValue, for: indexPath) as! MagazineTableViewCell
        let row = magazines[indexPath.row]
        
        cell.configureData(row: row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
