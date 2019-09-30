//
//  LocationService.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    private lazy var locationManager: CLLocationManager = {
        var locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.activityType = .automotiveNavigation
        locationManager.distanceFilter = 10.0
        locationManager.allowsBackgroundLocationUpdates = true
        
        return locationManager
    }()
    
    // TODO: пока сервис погоды лежит используем sample lon lat
    var coordinate: CLLocationCoordinate2D? = CLLocationCoordinate2D(latitude: 35, longitude: 139)
    
    override init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        // TODO: пока сервис погоды лежит используем sample lon lat
//        coordinate = locValue
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kLocationDidUpdate), object: nil)
    }
}
