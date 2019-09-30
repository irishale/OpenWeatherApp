//
//  CurrentForecastPresenterProtocol.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

protocol CurrentForecastPresenterProtocol {
    func fetchCurrentForecast(success: @escaping(CurrentForecastViewModel) -> Void,
                              failure: @escaping(Error) -> Void)
}
