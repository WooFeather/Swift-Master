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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapViewConfig()
    }

    func mapViewConfig() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        
        let annotation = MKPointAnnotation()
        var annotations: [MKAnnotation] = []
        
        for i in 0..<restaurants.count {
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurants[i].latitude, longitude: restaurants[i].longitude)
            annotation.title = restaurants[i].name
            annotations.append(annotation)
        }
        
        mapView.addAnnotations(annotations)
        
        // 여러 어노테이션을 띄우는 더 좋은 방법을 찾고있습니다.
//        for i in 0..<restaurants.count {
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurants[i].latitude, longitude: restaurants[i].longitude)
//            annotation.title = restaurants[i].name
//            
//            mapView.addAnnotation(annotation)
//        }
    }
}
