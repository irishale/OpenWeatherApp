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
    let kPressureTitle = "Pressure"
    let kHumidityTitle = "Humidity"
    let kWindSpeedTitle = "Wind speed"
    let kWindDirectionTitle = "Wind direction"
    
    // MARK: Properties
    let city: String!
    var weatherIconData: Data? = nil
    let temperature: String!
    let title: String!
    
    var pressure: NSAttributedString
    var humidity: NSAttributedString
    var windSpeed: NSAttributedString
    var windDirecton: NSAttributedString
    

    init(
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
        self.pressure = CurrentForecastViewModel.configureAdditionalBlock(kPressureTitle, pressure)
        self.humidity = CurrentForecastViewModel.configureAdditionalBlock(kHumidityTitle, humidity)
        self.windSpeed = CurrentForecastViewModel.configureAdditionalBlock(kWindSpeedTitle, windSpeed)
        self.windDirecton = CurrentForecastViewModel.configureAdditionalBlock(kWindDirectionTitle, windDirecton)
    }
    
    private static func configureAdditionalBlock(_ title: String, _ value: String) -> NSAttributedString {
        let kTitleFontSize: CGFloat = 12
        let kValueFontSize: CGFloat = 10
        
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: kTitleFontSize),
        ]
        let titleAttributedString = NSAttributedString(string: title, attributes: titleAttributes)
        
        let valueAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: kValueFontSize),
        ]
        let valueAttributedString = NSAttributedString(string: value, attributes: valueAttributes)
        
        let mutable = NSMutableAttributedString(attributedString: titleAttributedString)
        mutable.append(valueAttributedString)
        
        return mutable as NSAttributedString
    }
}
