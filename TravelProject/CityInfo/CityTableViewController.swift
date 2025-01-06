//
//  CityTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/6/25.
//

import UIKit

class CityTableViewController: UITableViewController {

    var cities = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Identifier.cityTableViewCell.rawValue, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Identifier.cityTableViewCell.rawValue)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cityTableViewCell.rawValue, for: indexPath) as! CityTableViewCell
        let row = cities[indexPath.row]
        
        cell.configureData(row: row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
