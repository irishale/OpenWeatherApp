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
//        view.startActivityIndicator()
        self.imageLoader.loadImage(
            with: imageIcon,
            success: { [weak self] (data) in
                success(data)
//                self?.viewModel?.weatherIconData = data
                
//                DispatchQueue.main.sync {
//                    self?.view.updateImage()
//                    self?.view.stopActivityIndicator()
//                }
            },
            failure: { [weak self] (error) in
//                DispatchQueue.main.sync {
//                    self?.view.stopActivityIndicator()
//                    self?.view.showPopup()
//                }
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
            
            weatherService.fetchHourlyForecast(
                params: params,
                success: { [weak self] (hourlyForecast) in
                    if let hourlyForecast: HourlyForecast = hourlyForecast {
                        self?.viewModels = hourlyForecast.list.map({ (weather) -> FutureForecastViewModel in
                            return FutureForecastViewModel(temperature: "\(weather.main.temperature)°С", title: weather.weather[0].title)
                        })
                        
                        for (index, forecast) in hourlyForecast.list.enumerated() {
                            
                            self?.loadImage(imageIcon: forecast.weather[0].iconString, success: { (data) in
                                self?.viewModels?[index].weatherIconData = data
                            })
                        }
//                            self?.loadImage(imageIcon: weather.iconString)
//
                            DispatchQueue.main.sync {
                                self?.view.updateTable(viewModels: self?.viewModels ?? [])
//                                self?.view.updateCityTitle()
//                                self?.view.updateWeatherInfo()
//                                self?.view.stopActivityIndicator()
                            }
                        
                    }
                },
                failure: { [weak self] (error) in
                    print(error)
//                    DispatchQueue.main.sync {
//                        self?.view.stopActivityIndicator()
//                        self?.view.showPopup()
//                    }
                }
            )
        }
    }
}
