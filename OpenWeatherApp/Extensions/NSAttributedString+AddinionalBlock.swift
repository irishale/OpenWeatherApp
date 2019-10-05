//
//  NSAttributedString+AddinionalBlock.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 06/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    static func configureAdditionalBlock(withTitle title: String,
                                         titleFontSize: CGFloat = 12,
                                         value: String,
                                         valueFontSize: CGFloat = 10) -> NSAttributedString {
        
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: titleFontSize),
        ]
        let titleAttributedString = NSAttributedString(string: title, attributes: titleAttributes)
        
        let valueAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: valueFontSize),
        ]
        let valueAttributedString = NSAttributedString(string: value, attributes: valueAttributes)
        
        let mutable = NSMutableAttributedString(attributedString: titleAttributedString)
        mutable.append(valueAttributedString)
        
        return mutable as NSAttributedString
    }
}
