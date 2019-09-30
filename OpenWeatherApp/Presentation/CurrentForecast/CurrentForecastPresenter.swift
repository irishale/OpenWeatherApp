//
//  CurrentForecastPresenter.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class CurrentForecastPresenter {
    
    // MARK: Injections
    var view: CurrentForecastViewProtocol!
    lazy var weatherService = WeatherService()
    lazy var locationManager = LocationManager()
    
    init(view: CurrentForecastViewProtocol) {
        self.view = view
    }
    
    
    
}

extension CurrentForecastPresenter: CurrentForecastPresenterProtocol {
    func fetchCurrentForecast() {
        if let coordinate = locationManager.coordinate {
            let params = [
                "lat": String(format: "%d", Int(coordinate.latitude)),
                "lon":String(format: "%d", Int(coordinate.longitude))
            ]
            weatherService.fetchCurrentForecast(
                params: params,
                success: { (weatherForecast) in
                    print("OK")
                    print(weatherForecast)
                },
                failure: { (error) in
                    print("НЕ ОК")
                })
            }
    }
}
