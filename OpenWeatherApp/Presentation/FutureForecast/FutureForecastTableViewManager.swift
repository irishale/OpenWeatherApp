//
//  FutureForecastTableViewManager.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class FutureForecastTableViewManager: NSObject {
    
    var tableView: UITableView!
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
        super.init()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func configure() {
        // сетим модели
        // обновляем таблицу
    }

}

extension FutureForecastTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension FutureForecastTableViewManager: UITableViewDelegate {
    
}
