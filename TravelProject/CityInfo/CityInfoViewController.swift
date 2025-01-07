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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityInfoCollectionView.delegate = self
        cityInfoCollectionView.dataSource = self

        navigationDesign()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func navigationDesign() {
        navigationItem.title = "인기 도시"
    }

}
