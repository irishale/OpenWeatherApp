//
//  CurrentForecastViewModel.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 01/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import UIKit

struct CurrentForecastViewModel {
    
    // MARK: Constants
    let kDateTitle = "Forecast to\n"
    let kPressureTitle = "Pressure\n"
    let kHumidityTitle = "Humidity\n"
    let kWindSpeedTitle = "Wind speed\n"
    let kWindDirectionTitle = "Wind direction\n"
    let kDateTitleFontSize: CGFloat = 16
    let kDateValueFontSize: CGFloat = 14
    
    // MARK: Properties
    let city: String!
    var weatherIconData: Data? = nil
    let temperature: String!
    let title: String!
    
    var date: NSAttributedString? = nil
    var pressure: NSAttributedString? = nil
    var humidity: NSAttributedString? = nil
    var windSpeed: NSAttributedString? = nil
    var windDirecton: NSAttributedString? = nil
    
    init(
        timestamp: Int64,
        city: String,
        temperature: String,
        title: String,
        pressure: String,
        humidity: String,
        windSpeed: String,
        windDirecton: String) {
        
        self.city = city
        self.temperature = temperature
        self.title = title
        
        let dateFromTimestamp = Date.convertTimestampToDate(timestamp)
        let stringFromDate = dateFromTimestamp.formattedDate("d MMMM yyyy, \nHH:mm")
        
        self.date = NSAttributedString.configureAdditionalBlock(withTitle: kDateTitle,
                                                                titleFontSize: kDateTitleFontSize,
                                                                value: stringFromDate,
                                                                valueFontSize: kDateValueFontSize)
        
        self.pressure = NSAttributedString.configureAdditionalBlock(withTitle: kPressureTitle,
                                                                    value: pressure)
        self.humidity = NSAttributedString.configureAdditionalBlock(withTitle: kHumidityTitle,
                                                                    value: humidity)
        self.windSpeed = NSAttributedString.configureAdditionalBlock(withTitle: kWindSpeedTitle,
                                                                     value: windSpeed)
        self.windDirecton = NSAttributedString.configureAdditionalBlock(withTitle: kWindDirectionTitle,
                                                                        value: windDirecton)
    }
}
