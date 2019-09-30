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
    
    let kTitleFontSize: CGFloat = 12
    let kValueFontSize: CGFloat = 10
    
    // MARK: Properties
    let weatherIconImage: Data
    let temperature: String
    let title: String
    
    var pressure: NSAttributedString
    var humidity: NSAttributedString
    var windSpeed: NSAttributedString
    var windDirecton: NSAttributedString
    
    mutating func configureAdditionalInfo(pressure: String,
                                 humidity: String,
                                 windSpeed: String,
                                 windDirecton: String) {
        self.pressure = configureAdditionalBlock(title: kPressureTitle, value: pressure)
        self.humidity = configureAdditionalBlock(title: kHumidityTitle, value: humidity)
        self.windSpeed = configureAdditionalBlock(title: kWindSpeedTitle, value: windSpeed)
        self.windDirecton = configureAdditionalBlock(title: kWindDirectionTitle, value: windDirecton)
    }
    
    private func configureAdditionalBlock(title: String, value: String) -> NSAttributedString {
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
