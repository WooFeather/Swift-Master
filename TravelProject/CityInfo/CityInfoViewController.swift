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
    
    var cities = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityInfoCollectionView.delegate = self
        cityInfoCollectionView.dataSource = self
        
        let xib = UINib(nibName: "CityInfoCollectionViewCell", bundle: nil)
        cityInfoCollectionView.register(xib, forCellWithReuseIdentifier: "CityInfoCollectionViewCell")

        navigationDesign()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityInfoCollectionView.dequeueReusableCell(withReuseIdentifier: "CityInfoCollectionViewCell", for: indexPath) as! CityInfoCollectionViewCell
        let item = cities[indexPath.item]
        
        cell.configureData(item: item)
        
        return cell
    }
    
    func navigationDesign() {
        navigationItem.title = "인기 도시"
    }

}
