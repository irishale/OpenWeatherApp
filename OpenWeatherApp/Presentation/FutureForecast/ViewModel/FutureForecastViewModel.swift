//
//  FutureForecastViewModel.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 05/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

struct FutureForecastViewModel {
    
    // MARK: Properties
    var weatherIconData: Data? = nil
    let temperature: String!
    let title: String!
    
    init(temperature: String, title: String) {
        self.temperature = temperature
        self.title = title
    }
}
