//
//  URLSession+CancelTasks.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 06/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

extension URLSession {
    func cancelTasks() {
        self.getAllTasks { (dataTasks) in
            if dataTasks.count == 0 {
                return
            }
            for task in dataTasks {
                task.cancel()
            }
        }
    }
}
