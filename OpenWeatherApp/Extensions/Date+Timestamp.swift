//
//  Date+Timestamp.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 06/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

extension Date {
    static func convertTimestampToDate(_ timestamp: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(timestamp))
    }
    
    func formattedDate(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
