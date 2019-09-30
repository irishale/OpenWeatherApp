//
//  WeatherService.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class WeatherService {
    let kAppId = "b6907d289e10d714a6e88b30761fae22"
    
    // TODO: сервис регистрации недоступен, пока используем примеры
    let kBaseUrl = "https://samples.openweathermap.org"
    let kCurrentForecastPath = "/data/2.5/weather"

    let defaultSession = URLSession(configuration: .default)
    
    var urlComponents: URLComponents? {
        guard var urlComponents = URLComponents(string: kBaseUrl) else { return nil }
        urlComponents.queryItems = [URLQueryItem(name: "appid", value: kAppId)]
        
        return urlComponents
    }
    
    func fetchCurrentForecast(params: [String:String], success: @escaping(WeatherForecast?) -> Void, failure: @escaping(Error?) -> Void) {
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
