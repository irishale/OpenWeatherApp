//
//  WeatherService.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class WeatherService {
    private let kAppId = "b6907d289e10d714a6e88b30761fae22"
    
    // TODO: сервис регистрации недоступен, пока используем примеры
    private let kBaseUrl = "https://samples.openweathermap.org"
    private let kCurrentForecastPath = "/data/2.5/weather"
    private let kHourlyForecastPath = "/data/2.5/forecast"

    private let defaultSession = URLSession(configuration: .default)
    
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
        var urlComponentsForCurrentForecast = self.urlComponents
        
        var queryItems = [URLQueryItem]()
        params.forEach { (key, value) in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        if let existingQueryItems: [URLQueryItem] = urlComponents?.queryItems {
            queryItems += existingQueryItems
        }
        
        urlComponentsForCurrentForecast?.path = kHourlyForecastPath
        urlComponentsForCurrentForecast?.queryItems = queryItems
        
        defaultSession.dataTask(with: urlComponentsForCurrentForecast!.url!) { data, response, error in
        */
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22")!
        defaultSession.dataTask(with: url) { data, response, error in
            
            do {
                if let data = data {
                    let decoder = JSONDecoder()
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        data, options: [])
                   
                    let model = try decoder.decode(HourlyForecast.self, from:
                        data)
                    success(model)
                }
            } catch let parsingError {
                failure(parsingError)
            }
        }.resume()
    }
    
    func fetchCurrentForecast(params: [String:String],
                              success: @escaping(WeatherForecast?) -> Void,
                              failure: @escaping(Error?) -> Void) {
        
        var urlComponentsForCurrentForecast = self.urlComponents
        
        var queryItems = [URLQueryItem]()
        params.forEach { (key, value) in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        if let existingQueryItems: [URLQueryItem] = urlComponents?.queryItems {
            queryItems += existingQueryItems
        }
        
        urlComponentsForCurrentForecast?.path = kCurrentForecastPath
        urlComponentsForCurrentForecast?.queryItems = queryItems
        
        defaultSession.dataTask(with: urlComponentsForCurrentForecast!.url!) { data, response, error in
            do {
                if let data = data {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(WeatherForecast.self, from:
                        data)
                    success(model)
                }
            } catch let parsingError {
                failure(parsingError)
            }
        }.resume()
    }
}
