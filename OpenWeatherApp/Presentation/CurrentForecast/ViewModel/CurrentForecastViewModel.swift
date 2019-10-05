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
        
        let dateFromTimestamp = convertTimestampToDate(timestamp)
        let stringFromDate = formattedDate(dateFromTimestamp, "d MMMM yyyy, \nHH:mm")
        
        self.date = self.configureAdditionalTitleForForecastDate(kDateTitle, stringFromDate)
        
        self.pressure = self.configureAdditionalBlock(kPressureTitle, pressure)
        self.humidity = self.configureAdditionalBlock(kHumidityTitle, humidity)
        self.windSpeed = self.configureAdditionalBlock(kWindSpeedTitle, windSpeed)
        self.windDirecton = self.configureAdditionalBlock(kWindDirectionTitle, windDirecton)
    }
    
    private func formattedDate(_ date: Date, _ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    private func convertTimestampToDate(_ timestamp: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(timestamp))
    }
    
    private func configureAdditionalTitleForForecastDate(_ title: String, _ value: String) -> NSAttributedString {
        let kTitleFontSize: CGFloat = 16
        let kValueFontSize: CGFloat = 14
        
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
    
    private func configureAdditionalBlock(_ title: String, _ value: String) -> NSAttributedString {
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
