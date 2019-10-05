//
//  FutureForecastViewModel.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 05/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import UIKit

struct FutureForecastViewModel {
    // MARK: Constants
    let kDateTitle = "Forecast to\n"
    
    // MARK: Properties
    var weatherIconData: Data? = nil
    let temperature: String!
    let title: String!
    var date: NSAttributedString? = nil
    
    init(temperature: String, title: String, date: String) {
        self.temperature = temperature
        self.title = title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "d MMMM yyyy, \nHH:mm"
            let formattedDate = dateFormatter.string(from: date)
            
            self.date = NSAttributedString.configureAdditionalBlock(withTitle: kDateTitle,
                                                                    value: formattedDate)
        }
    }
}
