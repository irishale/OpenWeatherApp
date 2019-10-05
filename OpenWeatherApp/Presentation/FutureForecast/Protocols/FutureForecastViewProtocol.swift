//
//  FutureForecastViewProtocol.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

protocol FutureForecastViewProtocol: class {
    var container: MainViewProtocol? { get }
    
    func updateTable(viewModels: [FutureForecastViewModel])
}
