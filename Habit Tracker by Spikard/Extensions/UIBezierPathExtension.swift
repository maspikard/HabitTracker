//
//  UIBezierPathExtension.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 01/09/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

extension UIBezierPath {
    
    static func circle(arcCenter: CGPoint, radius: CGFloat, startAngle: CGFloat = -0.5 * .pi, endAngle: CGFloat = 1.5 * .pi) -> UIBezierPath {
        return UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    }
}
