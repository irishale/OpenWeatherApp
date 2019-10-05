//
//  URLComponents+Build.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 06/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

extension URLComponents {
    func buildUrlComponents(withParams params: [String:String], path: String) -> URLComponents? {
        var components = self
        
        var queryItems = [URLQueryItem]()
        params.forEach { (key, value) in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        if let existingQueryItems: [URLQueryItem] = self.queryItems {
            queryItems += existingQueryItems
        }
        
        components.path = path
        components.queryItems = queryItems
        
        return components
    }
}
