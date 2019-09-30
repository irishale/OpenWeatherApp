//
//  FutureForecastPresenter.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class FutureForecastPresenter {
    
    // MARK: Injection
    var view: FutureForecastViewProtocol!
    
    init(view: FutureForecastViewProtocol) {
        self.view = view
    }
}

extension FutureForecastPresenter: FutureForecastPresenterProtocol {
    
}
