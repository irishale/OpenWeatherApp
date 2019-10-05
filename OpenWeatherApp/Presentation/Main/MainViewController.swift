//
//  ViewController.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

protocol MainViewProtocol {
    func startActivityIndicator()
    
    func stopActivityIndicator()
    
    func showPopup()
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "CurrentForecastSegue":
            let currentForecastViewController = segue.destination as! CurrentForecastViewController
            currentForecastViewController.container = self
        case "FutureForecastSegue":
            let futureForecastViewController = segue.destination as! FutureForecastViewController
            futureForecastViewController.container = self
        default: break
            
        }
    }
    
}

extension MainViewController: MainViewProtocol {
    func showPopup() {
        
    }
    
    func startActivityIndicator() {
        
    }
    
    func stopActivityIndicator() {
        
    }
}
