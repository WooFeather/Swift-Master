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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapViewConfig()
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
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
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
}
