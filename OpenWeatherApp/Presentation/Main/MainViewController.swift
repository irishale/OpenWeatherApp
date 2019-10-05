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
    
    func updateNavigationTitle(title: String)
}

class MainViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        default:
            break
        }
    }
    
}

extension MainViewController: MainViewProtocol {
    func updateNavigationTitle(title: String) {
        self.navigationController?.navigationBar.topItem?.title = title
    }
    
    func showPopup() {
        let alert = UIAlertController(title: "Network Error", message: "Server is temporarily unavailable.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func startActivityIndicator() {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}
