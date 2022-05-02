//
//  MapView.swift
//  BassPoint
//
//  Created by Kwangjun Kim on 2022/05/01.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapView: UIViewController {
    let mapView: MKMapView = {
        let mapView: MKMapView = MKMapView()
        
        return mapView
    }()
    
    var pin: MKPointAnnotation?
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        self.view.addSubview(mapView)
        self.mapView.frame = view.bounds
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = true
        
//        setRegion()
//        addPin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setRegion()
//        addPin()
    }
}

extension MapView {
    func setRegion(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
      
        print(latitude)
        print(longitude)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        
       
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.005,
                longitudeDelta: 0.005
            )
        )
        
        mapView.setRegion(region, animated: false)
        
        
        mapView.addAnnotation(annotation)
        
    }
    
    
    func addPin(latitude: CLLocationDegrees,longitude: CLLocationDegrees) {
        pin = MKPointAnnotation()
        guard let pin = pin else { return }
        DispatchQueue.main.async { [weak self] in
            pin.coordinate.longitude = latitude
            pin.coordinate.latitude = longitude
            self?.mapView.addAnnotation(pin)
            self?.removeMapPin(pin: pin)
        }
        
    }
    
    func removeMapPin(pin: MKPointAnnotation) {
            mapView.removeAnnotation(pin)
            self.pin = nil
    }
}

extension MapView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            setRegion(latitude: latitude, longitude: longitude)
            addPin(latitude: latitude, longitude: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Fail to get user location: \(error)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        switch status {
        case .notDetermined:
            //
            let alertViewController = UIAlertController(title: "Error", message: "Permission Error", preferredStyle: .alert)
            let alertAcation = UIAlertAction(title: "OK", style: .default)
            alertViewController.addAction(alertAcation)
        case .restricted:
            let alertViewController = UIAlertController(title: "Error", message: "Permission Error", preferredStyle: .alert)
            let alertAcation = UIAlertAction(title: "OK", style: .default)
            alertViewController.addAction(alertAcation)
        case .denied:
            let alertViewController = UIAlertController(title: "Error", message: "Permission Error", preferredStyle: .alert)
            let alertAcation = UIAlertAction(title: "OK", style: .default)
            alertViewController.addAction(alertAcation)
        case .authorizedAlways:
            //
//            getUserLocation()
            print("authorizedAlways")
        case .authorizedWhenInUse:
            //
//            getUserLocation()
            print("authorizedWhenInUse")
        case .authorized:
            //
//            getUserLocation()
            print("authorized")
        @unknown default:
            fatalError()
        }
    }
}
