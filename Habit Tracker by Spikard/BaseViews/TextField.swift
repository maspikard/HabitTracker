//
//  TextField.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 02.12.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

@IBDesignable
public class TextField: UITextField {

    @IBInspectable var paddingLeft: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + paddingLeft, y: bounds.origin.y, width: bounds.width - paddingLeft - paddingRight, height: bounds.height)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
