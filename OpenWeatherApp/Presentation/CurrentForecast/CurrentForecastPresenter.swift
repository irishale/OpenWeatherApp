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
    
    // MARK: Properties
    var viewModel: CurrentForecastViewModel?
    
    init(view: CurrentForecastViewProtocol) {
        self.view = view
    }
    
    private func loadImage(imageIcon: String) {
        view.startActivityIndicator()
        self.imageLoader.loadImage(
            with: imageIcon,
            success: { [weak self] (data) in
                self?.viewModel?.weatherIconData = data
                self?.view.stopActivityIndicator()
            },
            failure: { [weak self] (error) in
                self?.view.stopActivityIndicator()
                self?.view.showPopup()
            }
        )
    }
}

extension CurrentForecastPresenter: CurrentForecastPresenterProtocol {

    func fetchCurrentForecast() {
        if let coordinate = locationManager.coordinate {
            
            let latitudeString = String(format: "%d", Int(coordinate.latitude))
            let longitudeString = String(format: "%d", Int(coordinate.longitude))
            
            let params = [
                "lat": latitudeString,
                "lon": longitudeString
            ]
            
            view.startActivityIndicator()
            weatherService.fetchCurrentForecast(
                params: params,
                success: { [weak self] (weatherForecast) in
                    if let weatherForecast: WeatherForecast = weatherForecast {
                        if let weather = weatherForecast.weather.first {
                           self?.viewModel =
                            CurrentForecastViewModel(
                                temperature: "\(weatherForecast.main.temperature)°С",
                                title: weather.title,
                                pressure: "\(weatherForecast.main.pressure) hPa",
                                humidity: "\(weatherForecast.main.humidity)%",
                                windSpeed: "\(weatherForecast.wind.speed) miles/hour",
                                windDirecton: "\(weatherForecast.wind.degrees)°"
                            )
                            
                            self?.loadImage(imageIcon: weather.iconString)
                            self?.view.stopActivityIndicator()
                        }
                    }
                },
                failure: { [weak self] (error) in
                    self?.view.stopActivityIndicator()
                    self?.view.showPopup()
                }
            )
        } else {
            view.showPopup()
        }
    }
}
