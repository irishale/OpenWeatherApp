//
//  URLSessionManager.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 06/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class URLSessionManager {
    private let defaultSession = URLSession(configuration: .default)
    
    func resumeDataTask<T: Decodable>(url: URL,
                                      success: @escaping (_ model: T) -> Void,
                                      failure: @escaping (_ error: Error?) -> Void) {
        defaultSession.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(T.self, from:
                        data)
                    success(model)
                }
            } catch let parsingError {
                failure(parsingError)
            }
        }.resume()
    }
}
