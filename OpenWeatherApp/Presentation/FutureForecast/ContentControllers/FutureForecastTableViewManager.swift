//
//  FutureForecastTableViewManager.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class FutureForecastTableViewManager: NSObject {
    
    // MARK: Constants
    let kRowHeight: CGFloat = 70
    let identifier = "HourlyForecastTableViewCell"
    
    var tableView: UITableView!
    private var viewModels: [FutureForecastViewModel]?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
        super.init()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func configure(viewModels: [FutureForecastViewModel]) {
        self.viewModels = viewModels
        self.tableView.reloadData()
    }

}

extension FutureForecastTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kRowHeight
    }
}

extension FutureForecastTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch cell {
        case is HourlyForecastTableViewCell:
            let unwrappedCell = cell as! HourlyForecastTableViewCell
            if let viewModel = viewModels?[indexPath.row] {
                unwrappedCell.configure(withViewModel: viewModel)
            }
        default:
            return
        }
    }
}
