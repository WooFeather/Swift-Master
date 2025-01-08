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
    var filteredRestaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapViewConfig()
    }
    
    @IBAction func mapSegmentControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants
            print("♥️\(filteredRestaurants)💙")
            reloadAnnotation()
        case 1:
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == "한식" }
            print("♥️\(filteredRestaurants)💙")
            reloadAnnotation()
        case 2:
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == "중식" }
            print("♥️\(filteredRestaurants)💙")
            reloadAnnotation()
        case 3:
            mapView.removeAnnotations(mapView.annotations)
            filteredRestaurants = restaurants.filter { $0.category == "양식" }
            print("♥️\(filteredRestaurants)💙")
            reloadAnnotation()
        default:
            filteredRestaurants = restaurants
        }
    }
    
    func mapViewConfig() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 300, longitudinalMeters: 300)
        
        for i in 0..<restaurants.count {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurants[i].latitude, longitude: restaurants[i].longitude)
            annotation.title = restaurants[i].name
            
            mapView.showAnnotations([annotation], animated: true)
        }
    }
    
    func reloadAnnotation() {
        for i in 0..<filteredRestaurants.count {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: filteredRestaurants[i].latitude, longitude: filteredRestaurants[i].longitude)
            annotation.title = filteredRestaurants[i].name

            mapView.showAnnotations([annotation], animated: true)
        }
    }
}
