//
//  UIViewExtension.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 27/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue }
        get { return layer.shadowOffset }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        set { layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        set { layer.shadowColor = newValue?.cgColor }
        get { return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil }
    }
    
    @IBInspectable var rotate: CGFloat {
        set { transform = CGAffineTransform(rotationAngle: newValue * .pi/180) }
        get { return 0 }
    }
    
    func findConstraint(type: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if let constraint = findConstraintInSuperview(type: type) {
            return constraint
        }
        
        for constraint in constraints {
            if constraint.firstAttribute == type && constraint.isActive {
                return constraint
            }
        }
        
        return nil
    }
    
    func findConstraintInSuperview(type: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if let superview = superview {
            for constraint in superview.constraints {
                
                let isFirstItemIsSelf = (constraint.firstItem as? UIView) == self
                let isSecondItemIsSelf = (constraint.secondItem as? UIView) == self
                let isConstraintAssociatedWithSelf = (isFirstItemIsSelf || isSecondItemIsSelf)
                
                if constraint.firstAttribute == type && isConstraintAssociatedWithSelf {
                    return constraint
                }
            }
        }
        
        return nil
    }
}
