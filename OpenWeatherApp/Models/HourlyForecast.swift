//
//  FutureForecast.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 03/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

struct HourlyForecast: Decodable {
    let list: [HourlyWeather]
    let city: City
}

struct HourlyWeather: Decodable {
    let main: Main
    let weather: [Weather]
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case date = "dt_txt"
    }
}

struct City: Decodable {
    let name: String
}
