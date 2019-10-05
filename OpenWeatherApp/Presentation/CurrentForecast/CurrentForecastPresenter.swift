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
        DispatchQueue.main.async {
            self.view.container?.startActivityIndicator()
        }
        self.imageLoader.loadImage(
            with: imageIcon,
            success: { [unowned self] (data) in
                self.viewModel?.weatherIconData = data
                
                DispatchQueue.main.sync {
                    self.view.updateImage()
                    self.view.container?.stopActivityIndicator()
                    self.view.stubVisibility(hidden: true)
                }
            },
            failure: { [unowned self] (error) in
                DispatchQueue.main.sync {
                    self.view.container?.stopActivityIndicator()
                    self.view.container?.showPopup()
                    self.view.stubVisibility(hidden: false)
                }
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
            
            DispatchQueue.main.async {
                self.view.container?.startActivityIndicator()
            }
            weatherService.fetchCurrentForecast(
                params: params,
                success: { [unowned self] (weatherForecast) in
                    if let weatherForecast: CurrentForecast = weatherForecast,
                        let weather = weatherForecast.weather.first {
                        
                        self.viewModel =
                            CurrentForecastViewModel(
                                timestamp: weatherForecast.timestamp,
                                city: weatherForecast.city,
                                temperature: "\(weatherForecast.main.temperature)°F",
                                title: weather.title,
                                pressure: "\(weatherForecast.main.pressure) hPa",
                                humidity: "\(weatherForecast.main.humidity)%",
                                windSpeed: "\(weatherForecast.wind.speed) miles/hour",
                                windDirecton: "\(weatherForecast.wind.degrees)°"
                            )

                            self.loadImage(imageIcon: weather.iconString)

                            DispatchQueue.main.async {
                                self.view.updateCityTitle()
                                self.view.updateWeatherInfo()
                                self.view.container?.stopActivityIndicator()
                                self.view.stubVisibility(hidden: true)
                            }
                    }
                },
                failure: { [unowned self] (error) in
                    DispatchQueue.main.async {
                        self.view.container?.stopActivityIndicator()
                        self.view.container?.showPopup()
                        self.view.stubVisibility(hidden: false)
                    }
                }
            )
        } else {
            view.container?.showPopup()
            view.stubVisibility(hidden: false)
        }
    }
}
