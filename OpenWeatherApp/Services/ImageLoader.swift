//
//  ImageLoader.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 30/09/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class ImageLoader {
    let kBaseUrl = "http://openweathermap.org"
    let kImagePath = "/img/w"
    
    let defaultSession = URLSession(configuration: .default)
    
    var urlComponents: URLComponents? {
        guard let urlComponents = URLComponents(string: kBaseUrl) else { return nil }
        
        return urlComponents
    }
    
    func loadImage(with name: String, success: @escaping(Data?) -> Void, failure: @escaping(Error?) -> Void) {
        var urlComponents = self.urlComponents
        urlComponents?.path = "\(kImagePath)/\(name).png"
        
        do {
            let data = try Data(contentsOf: urlComponents!.url!)
            success(data)
        } catch let error {
            failure(error)
        }
    }
}
