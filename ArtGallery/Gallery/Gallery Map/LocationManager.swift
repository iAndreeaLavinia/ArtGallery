//
//  LocationManager.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 13/02/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit
import MapKit

protocol LocationManagerDelegate: class {
    func locationDidUpdate(region: MKCoordinateRegion)
}

class LocationManager: NSObject, CLLocationManagerDelegate {

    weak var delegate: LocationManagerDelegate?
    fileprivate let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    func currentLocation() {
       locationManager.delegate = self
       locationManager.desiredAccuracy = kCLLocationAccuracyBest
       if #available(iOS 11.0, *) {
          locationManager.showsBackgroundLocationIndicator = true
       } else {
          // Fallback on earlier versions
       }
       locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let location = locations.last! as CLLocation
       let currentLocation = location.coordinate
       let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 800, longitudinalMeters: 800)
       delegate?.locationDidUpdate(region: coordinateRegion)
       locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       print(error.localizedDescription)
    }
}
