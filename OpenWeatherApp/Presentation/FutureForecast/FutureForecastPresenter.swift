//
//  FutureForecastPresenter.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class FutureForecastPresenter {
    
    // MARK: Properties
    var viewModels: [FutureForecastViewModel]?
    
    // MARK: Injection
    weak var view: FutureForecastViewProtocol!
    lazy var weatherService = WeatherService()
    lazy var locationManager = LocationManager()
    lazy var imageLoader = ImageLoader()
    
    init(view: FutureForecastViewProtocol) {
        self.view = view
    }
    
    private func loadImage(imageIcon: String,
                           success:@escaping (_ imageData: Data?) -> Void) {
        
        DispatchQueue.main.async {
            self.view.container?.startActivityIndicator()
        }
        self.imageLoader.loadImage(
            with: imageIcon,
            success: { (data) in
                success(data)
            },
            failure: { [unowned self] (error) in
                DispatchQueue.main.sync {
                    self.view.container?.stopActivityIndicator()
                    self.view.container?.showPopup()
                }
            }
        )
    }
}

extension FutureForecastPresenter: FutureForecastPresenterProtocol {
    func fetchHourlyForecast() {
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
            weatherService.fetchHourlyForecast(
                params: params,
                success: { [unowned self] (hourlyForecast) in
                    if let hourlyForecast: HourlyForecast = hourlyForecast {
                        self.viewModels = hourlyForecast.list.map({ (weather) -> FutureForecastViewModel in
                            
                            let weatherFirstObject = weather.weather[0]
                            return FutureForecastViewModel(temperature: "\(weather.main.temperature)°F", title: weatherFirstObject.title, date: weather.date)
                            
                        })
                        
                        for (index, forecast) in hourlyForecast.list.enumerated() {
                            let weatherFirstObject = forecast.weather[0]
                            
                            self.loadImage(imageIcon: weatherFirstObject.iconString, success: { (data) in
                                self.viewModels?[index].weatherIconData = data
                            })
                        }
                        
                        DispatchQueue.main.async {
                            self.view.updateTable(viewModels: self.viewModels ?? [])
                            self.view.container?.stopActivityIndicator()
                            self.view.tableVisibility(hidden: false)
                        }
                        
                    }
                },
                failure: { [unowned self] (error) in
                   
                    DispatchQueue.main.async {
                        self.view.container?.stopActivityIndicator()
                        self.view.tableVisibility(hidden: true)
                        self.view.container?.showPopup()
                    }
                }
            )
        }
    }
}
