//
//  FutureForecastPresenterProtocol.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

protocol FutureForecastPresenterProtocol {
    var viewModels: [FutureForecastViewModel]? { get }
    
    func fetchHourlyForecast()
}
