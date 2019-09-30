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
    lazy var imageLoader = ImageLoader()
    
    init(view: CurrentForecastViewProtocol) {
        self.view = view
    }
}

extension CurrentForecastPresenter: CurrentForecastPresenterProtocol {
    func fetchCurrentForecast(success: @escaping(CurrentForecastViewModel) -> Void,
                              failure: @escaping(Error) -> Void) {
        if let coordinate = locationManager.coordinate {
            
            let latitudeString = String(format: "%d", Int(coordinate.latitude))
            let longitudeString = String(format: "%d", Int(coordinate.longitude))
            
            let params = [
                "lat": latitudeString,
                "lon": longitudeString
            ]
            
            weatherService.fetchCurrentForecast(
                params: params,
                success: { [weak self] (weatherForecast) in
                    if let weatherForecast: WeatherForecast = weatherForecast {
                        if let weather = weatherForecast.weather.first {
                           
                        }
                    }
                },
                failure: { (error) in
                    print("НЕ ОК")
                })
            }
    }
    
    func loadImage(imageIcon: String, success: @escaping (Data?) -> Void, failure: @escaping (Error?) -> Void ) {
        self.imageLoader.loadImage(
            with: imageIcon,
            success: { (data) in
                success(data)
        },
            failure: { (error) in
                failure(error)
        })
    }
}
