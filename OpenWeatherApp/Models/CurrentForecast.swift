//
//  CurrentWeather.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

struct CurrentForecast: Decodable {
    let city: String
    let timestamp: Int64
    
    let weather: [Weather]
    let wind: Wind
    let main: Main
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case weather
        case wind
        case main
        case timestamp = "dt"
    }
}

struct Wind: Decodable {
    let speed: Float
    let degrees: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}

struct Weather: Decodable {
    let title: String
    let iconString: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "main"
        case iconString = "icon"
        case description
    }
}

struct Main: Decodable {
    let temperature: Float
    let pressure: Float
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}
