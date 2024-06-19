//
//  MapViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/30/24.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    let restaurantArr = RestaurantList.restaurantArray
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        locationManager.delegate = self
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
    
    @IBAction func currentLocationButtonPressed(_ sender: UIButton) {
        checkDeviceLocationAuthorization()
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

//MARK: - MKMapViewDelegate, CLLocationManagerDelegate
extension MapViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "something")
        annotationView.markerTintColor = .systemPurple
        return annotationView
    }
    
    func checkDeviceLocationAuthorization() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                let authorization: CLAuthorizationStatus
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(state: authorization)
                }
            } else {
                print("User Device Location Authorization Denied")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(state: CLAuthorizationStatus) {
        switch state {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            showLocationSettingAlert()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            print("Error")
        }
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 이용할 수 없습니다. 기기의 '설정 > 개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        let goSettingAction = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            guard let setting = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(setting)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(goSettingAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    func setUpRegionAndAnnotation(coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
    }
    
    //Location Updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        setUpRegionAndAnnotation(coordinate: coordinate)
        locationManager.stopUpdatingLocation()
    }
    //Location Update Failed
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location Update Failed")
    }
    //Change Authorization
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
}
