//
//  CurrentForecastViewController.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class CurrentForecastViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    
    // MARK: Injections
    lazy var presenter: CurrentForecastPresenterProtocol = CurrentForecastPresenter(view: self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.fetchCurrentForecast()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupInitialState() {
        
    }
    
}

extension CurrentForecastViewController: CurrentForecastViewProtocol {
    func showPopup() {
        
    }
    
    func startActivityIndicator() {
        
    }
    
    func stopActivityIndicator() {
        
    }
    
    func updateWeatherInfo() {
        
    }
    
    func updateImage() {
        
    }
}
