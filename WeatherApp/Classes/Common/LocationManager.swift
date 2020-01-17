//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 17/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    var location: ((_ lat: Double, _ lon: Double) -> Void)? = nil
    
    override init() {
        super.init()
    }
    
    func start() {
        locationManager.requestAlwaysAuthorization()
        if(CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location?(locations[0].coordinate.latitude, locations[0].coordinate.longitude)
    }
}
