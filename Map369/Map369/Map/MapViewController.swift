//
//  MapViewController.swift
//  Map369
//
//  Created by 조우현 on 1/8/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet var mapSegmentControl: UISegmentedControl!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var actionSheetButton: UIButton!
    
    let restaurants = RestaurantList().restaurantArray
    var filteredRestaurants: [Restaurant] = RestaurantList().restaurantArray
    let categories = ["한식", "양식", "일식", "중식", "분식", "카페", "샐러드"]
    var selectedCategory = "전체"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapViewConfig()
        actionSheetButtonDesign()
        actionSheetButtonConfig()
    }
    
    @objc private func showActionSheet() {
        let actionSheet = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        
        // 반복되는 코드를 어떻게 합칠까
        let korean = UIAlertAction(
            title: categories[0],
            style: .default
            // 캡쳐리스트 개념..공부...
        ) { [self] action in
            // 필터링
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == categories[0] }
            setAnnotation()
            // selectedCategory에 title 넣기
            selectedCategory = categories[0]
            // 이렇게 매번 actionSheetButtonDesign() 함수를 호출하는것 외의 방법은?
            actionSheetButtonDesign()
        }
        
        let western = UIAlertAction(
            title: categories[1],
            style: .default
            // 이렇게 전부 self 붙여주는것과 위의 차이점 알아보기!!!
        ) { action in
            self.mapView.removeAnnotations(self.mapView.annotations)
            self.filteredRestaurants = self.restaurants.filter { $0.category == self.categories[1] }
            self.setAnnotation()
            self.selectedCategory = self.categories[1]
            self.actionSheetButtonDesign()
        }
        
        let japanese = UIAlertAction(
            title: categories[2],
            style: .default
        ) { [self] action in
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == categories[2] }
            setAnnotation()
            selectedCategory = categories[2]
            actionSheetButtonDesign()
        }
        
        let chinese = UIAlertAction(
            title: categories[3],
            style: .default
        ) { [self] action in
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == categories[3] }
            setAnnotation()
            selectedCategory = categories[3]
            actionSheetButtonDesign()
        }
        
        let snack = UIAlertAction(
            title: categories[4],
            style: .default
        ) { [self] action in
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == categories[4] }
            setAnnotation()
            selectedCategory = categories[4]
            actionSheetButtonDesign()
        }
        
        let cafe = UIAlertAction(
            title: categories[5],
            style: .default
        ) { [self] action in
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == categories[5] }
            setAnnotation()
            selectedCategory = categories[5]
            actionSheetButtonDesign()
        }
        
        let salad = UIAlertAction(
            title: categories[6],
            style: .default
        ) { [self] action in
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == categories[6] }
            setAnnotation()
            selectedCategory = categories[6]
            actionSheetButtonDesign()
        }
        
        let all = UIAlertAction(
            title: "전체",
            style: .default
        ) { [self] action in
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants
            setAnnotation()
            selectedCategory = "전체"
            actionSheetButtonDesign()
        }
        
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        ) { action in }
        
        [korean, western, japanese, chinese, snack, cafe, salad, all, cancel].forEach {
            actionSheet.addAction($0)
        }
        
        present(actionSheet, animated: true, completion: nil)
    }

    
    @IBAction func mapSegmentControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // removeAnnotations() 함수를 몰라서 몇시간동안 고생했네 ㅜ ㅜ
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants
            print("♥️\(filteredRestaurants)💙")
            setAnnotation()
        case 1:
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == "한식" }
            print("♥️\(filteredRestaurants)💙")
            setAnnotation()
        case 2:
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == "중식" }
            print("♥️\(filteredRestaurants)💙")
            setAnnotation()
        case 3:
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == "양식" }
            print("♥️\(filteredRestaurants)💙")
            setAnnotation()
        default:
            filteredRestaurants = restaurants
        }
    }
    
    func mapViewConfig() {
        let center = CLLocationCoordinate2D(latitude: 37.6543873, longitude: 127.0478787)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 300, longitudinalMeters: 300)
        
        setAnnotation()
    }
    
    func setAnnotation() {
        for i in 0..<filteredRestaurants.count {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: filteredRestaurants[i].latitude, longitude: filteredRestaurants[i].longitude)
            annotation.title = filteredRestaurants[i].name

            mapView.showAnnotations([annotation], animated: true)
        }
    }
    
    func actionSheetButtonDesign() {
        actionSheetButton.setTitle(selectedCategory, for: .normal)
        actionSheetButton.setImage(UIImage(systemName: "chevron.up.chevron.down"), for: .normal)
        actionSheetButton.semanticContentAttribute = .forceRightToLeft
        actionSheetButton.setPreferredSymbolConfiguration(.init(scale: .small), forImageIn: .normal)
    }
    
    func actionSheetButtonConfig() {
        actionSheetButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
    }
}
