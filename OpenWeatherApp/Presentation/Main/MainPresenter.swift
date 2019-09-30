//
//  MainPresenter.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class MainPresenter {
    let ws = WeatherService()
    var locationManager = LocationManager()
    
    init() {
          NotificationCenter.default.addObserver(self, selector: #selector(fetchWeatherInfo), name: NSNotification.Name(rawValue: kLocationDidUpdate), object: nil)
    }
    
    @objc func fetchWeatherInfo() {
        // TODO: пока сервис погоды лежит используем sample lon lat
        ws.fetchCurrentForecast(params: [
            "lat": String(format: "%d", Int(locationManager.coordinate!.latitude)),
            "lon": String(format: "%d", Int(locationManager.coordinate!.longitude))
            ], success: {_ in
                
        }, failure: {_ in
            
        })
    }
}
