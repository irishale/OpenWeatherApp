//
//  CurrentForecastViewProtocol.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

protocol CurrentForecastViewProtocol {
    var container: MainViewProtocol? { get }
    
    func updateCityTitle()
    
    func updateWeatherInfo()    
    
    func updateImage()
    
    func stubVisibility(hidden: Bool)
}
