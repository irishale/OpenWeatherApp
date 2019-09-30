//
//  FutureForecastViewController.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class FutureForecastViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Injections
    lazy var tableViewManager = FutureForecastTableViewManager(tableView: tableView)
    lazy var presenter: FutureForecastPresenterProtocol = FutureForecastPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension FutureForecastViewController: FutureForecastViewProtocol {
    
}
