//
//  CityInfoViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/7/25.
//

import UIKit

class CityInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var cityInfoCollectionView: UICollectionView!
    @IBOutlet var citySegmentControl: UISegmentedControl!
    @IBOutlet var searchTextField: UITextField!
    
    var cities = CityInfo().city
    var filteredCities: [City] = []
    var searchedCities: [City] = []
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConfig()
        xibConfig()
        navigationDesign()
        cellLayout()
    }
    
    @IBAction func searchTextFieldDidEndOnExit(_ sender: UITextField) {
        searchCities()
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: UITextField) {
        searchCities()
    }
    
    @IBAction func citySegmentControlValueChanged(_ sender: UISegmentedControl) {
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
        cityInfoCollectionView.reloadData()
    }
    
    func searchCities() {
        let searchText = searchTextField.text!.trimmingCharacters(in: .whitespaces)
        
        print(searchText)
        
        if searchText.isEmpty {
            isSearching = false
            switch citySegmentControl.selectedSegmentIndex {
            case 0:
                searchedCities = cities
            case 1:
                searchedCities = filteredCities
            case 2:
                searchedCities = filteredCities
            default:
                searchedCities = cities
            }
        } else {
            isSearching = true
            switch citySegmentControl.selectedSegmentIndex {
            case 0:
                searchedCities = cities.filter {
                    $0.city_name.contains(searchText) || $0.city_english_name.lowercased().contains(searchText.lowercased()) || $0.city_explain.contains(searchText)
                }
            case 1:
                searchedCities = filteredCities.filter {
                    $0.city_name.contains(searchText) || $0.city_english_name.lowercased().contains(searchText.lowercased()) || $0.city_explain.contains(searchText)
                }
            case 2:
                searchedCities = filteredCities.filter {
                    $0.city_name.contains(searchText) || $0.city_english_name.lowercased().contains(searchText.lowercased()) || $0.city_explain.contains(searchText)
                }
            default:
                searchedCities = cities.filter {
                    $0.city_name.contains(searchText) || $0.city_english_name.lowercased().contains(searchText.lowercased()) || $0.city_explain.contains(searchText)
                }
            }
        }
        print(searchedCities)
        cityInfoCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch citySegmentControl.selectedSegmentIndex {
        case 0:
            return isSearching ? searchedCities.count : cities.count
        case 1:
            return isSearching ? searchedCities.count : filteredCities.count
        case 2:
            return isSearching ? searchedCities.count : filteredCities.count
        default:
            return isSearching ? searchedCities.count : cities.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityInfoCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.cityInfoCollectionViewCell.rawValue, for: indexPath) as! CityInfoCollectionViewCell
        
        switch citySegmentControl.selectedSegmentIndex {
        case 0:
            let item = isSearching ? searchedCities[indexPath.item] : cities[indexPath.item]
            cell.configureData(item: item)
        case 1:
            let item = isSearching ? searchedCities[indexPath.item] : filteredCities[indexPath.item]
            cell.configureData(item: item)
        case 2:
            let item = isSearching ? searchedCities[indexPath.item] : filteredCities[indexPath.item]
            cell.configureData(item: item)
        default:
            let item = isSearching ? searchedCities[indexPath.item] : cities[indexPath.item]
            cell.configureData(item: item)
        }
        
        return cell
    }
    
    func collectionViewConfig() {
        cityInfoCollectionView.delegate = self
        cityInfoCollectionView.dataSource = self
    }
    
    func xibConfig() {
        let xib = UINib(nibName: Identifier.cityInfoCollectionViewCell.rawValue, bundle: nil)
        cityInfoCollectionView.register(xib, forCellWithReuseIdentifier: Identifier.cityInfoCollectionViewCell.rawValue)
    }
    
    func navigationDesign() {
        navigationItem.title = "인기 도시"
    }
    
    func cellLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 240)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 20, left: 24, bottom: 20, right: 24)
        
        cityInfoCollectionView.collectionViewLayout = layout
    }
}
