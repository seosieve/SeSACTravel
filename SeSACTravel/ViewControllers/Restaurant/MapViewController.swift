//
//  MapViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/30/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    let restaurantArr = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        navigationController?.navigationBar.tintColor = .gray
        navigationItem.title = "Restaurant Map"
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonPressed))
        navigationItem.rightBarButtonItem = filterButton
        
        mapView.delegate = self
        let location = CLLocationCoordinate2D(latitude: restaurantArr[3].latitude, longitude: restaurantArr[3].longitude)
        mapView.region = MKCoordinateRegion(center: location, latitudinalMeters: 800, longitudinalMeters: 800)
        
        for restaurant in restaurantArr {
            let annotation = MKPointAnnotation()
            let location = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            annotation.coordinate = location
            annotation.title = restaurant.name
            mapView.addAnnotation(annotation)
        }
    }
    
    @objc func filterButtonPressed() {
        filterActionSheet()
    }
    
    func filterActionSheet() {
        let alert = UIAlertController(title: "원하시는 카테고리를 골라주세요.", message: "짭짭..쯔업ㅈ짭..쯔업짜압짭", preferredStyle: .actionSheet)
        let all = UIAlertAction(title: "전체", style: .default) { action in
            self.filterAction(category: action.title)
        }
        let korean = UIAlertAction(title: "한식", style: .default) { action in
            self.filterAction(category: action.title)
        }
        let chinese = UIAlertAction(title: "중식", style: .default) { action in
            self.filterAction(category: action.title)
        }
        let instant = UIAlertAction(title: "분식", style: .default) { action in
            self.filterAction(category: action.title)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        [all, korean, chinese, instant, cancel].forEach { action in
            alert.addAction(action)
        }
        self.present(alert, animated: true)
    }
    
    func filterAction(category: String?) {
        guard let category else { return }
        //Clean All
        let annotations = self.mapView.annotations
        self.mapView.removeAnnotations(annotations)
        
        for restaurant in restaurantArr {
            if restaurant.category == category || category == "전체" {
                let annotation = MKPointAnnotation()
                let location = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
                annotation.coordinate = location
                annotation.title = restaurant.name
                mapView.addAnnotation(annotation)
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
}
