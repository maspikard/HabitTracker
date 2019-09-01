//
//  FontExtension.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 27/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

enum FontWeight: String {
    
    case light    = "Light"
    case regular  = "Regular"
    case medium   = "Medium"
    case semibold = "Semibold"
    case bold     = "Bold"
}

extension UIFont {
    
    static let dayOfWeekFont = SFProText(size: 14, weight: .regular)
    static let dayFont = SFProText(size: 13)
    
    static func SFProDisplay(size: CGFloat, weight: FontWeight = .regular) -> UIFont {
        
        return UIFont(name: "SFProDisplay-" + weight.rawValue, size: size)!
    }
    
    static func SFProText(size: CGFloat, weight: FontWeight = .regular) -> UIFont {
        
        return UIFont(name: "SFProText-" + weight.rawValue, size: size)!
    }
}
