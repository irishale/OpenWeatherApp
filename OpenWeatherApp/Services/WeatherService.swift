//
//  WeatherService.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class WeatherService {
    
    // MARK: Constants
    private let kAppId = "b6907d289e10d714a6e88b30761fae22"
    
    // TODO: сервис регистрации недоступен, пока используем примеры
    private let kBaseUrl = "https://samples.openweathermap.org"
    private let kCurrentForecastPath = "/data/2.5/weather"
    private let kHourlyForecastPath = "/data/2.5/forecast"
    
    // MARK: Injections
    private let urlSessionManager = URLSessionManager()
    
    // MARK: Properties
    private var urlComponents: URLComponents? {
        guard var urlComponents = URLComponents(string: kBaseUrl) else { return nil }
        urlComponents.queryItems = [URLQueryItem(name: "appid", value: kAppId)]
        
        return urlComponents
    }
    
    func fetchHourlyForecast(params: [String:String],
                             success: @escaping(HourlyForecast?) -> Void,
                             failure: @escaping(Error?) -> Void) {
        
        // TODO: сервис недоступен, хардкодим урл с семплом
        /*
        var urlComponentsForCurrentForecast = urlComponents?.buildUrlComponents(withParams: params, path: kHourlyForecastPath)
        
        defaultSession.dataTask(with: urlComponentsForCurrentForecast!.url!) { data, response, error in
        */
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22")!
        
        urlSessionManager.resumeDataTask(url: url, success: { (hourlyForecast) in
            success(hourlyForecast)
        }) { (error) in
            failure(error)
        }
    }
    
    func fetchCurrentForecast(params: [String:String],
                              success: @escaping(CurrentForecast?) -> Void,
                              failure: @escaping(Error?) -> Void) {
        
        // TODO: сервис недоступен, хардкодим урл с семплом
        /*
        var urlComponentsForCurrentForecast = urlComponents?.buildUrlComponents(withParams: params, path: kCurrentForecastPath)
         
         defaultSession.dataTask(with: urlComponentsForCurrentForecast!.url!) { data, response, error in
        */
        
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22")!
        
        urlSessionManager.resumeDataTask(url: url, success: { (currentForecast) in
            success(currentForecast)
        }) { (error) in
            failure(error)
        }
    }
}
