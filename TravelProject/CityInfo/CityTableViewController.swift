//
//  CityTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/6/25.
//

import UIKit

class CityTableViewController: UITableViewController {

    @IBOutlet var travelSegmentControl: UISegmentedControl!
    var cities = CityInfo().city
    var filteredCities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Identifier.cityTableViewCell.rawValue, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Identifier.cityTableViewCell.rawValue)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch travelSegmentControl.selectedSegmentIndex {
        case 0:
            return cities.count
        case 1:
            return filteredCities.count
        case 2:
            return filteredCities.count
        default:
            return cities.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cityTableViewCell.rawValue, for: indexPath) as! CityTableViewCell
        
        switch travelSegmentControl.selectedSegmentIndex {
        case 0:
            let row = cities[indexPath.row]
            cell.configureData(row: row)
        case 1:
            let row = filteredCities[indexPath.row]
            cell.configureData(row: row)
        case 2:
            let row = filteredCities[indexPath.row]
            cell.configureData(row: row)
        default:
            let row = cities[indexPath.row]
            cell.configureData(row: row)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("모두")
            filteredCities = cities
            print(filteredCities)
        case 1:
            print("국내")
            filteredCities = cities.filter { $0.domestic_travel }
            print(filteredCities)
        case 2:
            print("해외")
            filteredCities = cities.filter { $0.domestic_travel == false }
            print(filteredCities)
        default:
            break
        }
        tableView.reloadData()
    }
}
