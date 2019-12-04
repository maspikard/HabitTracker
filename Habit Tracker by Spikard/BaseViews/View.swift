//
//  View.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 27/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

@IBDesignable
public class View: UIView {
    
    // MARK: - Private properties
    
    private var innerShadowLayer: CALayer?

    // MARK: - Public properties
    
    @IBInspectable public var isRounded: Bool = false { didSet { updateRounded() } }
    
    @IBInspectable public var innerShadow: Bool = false             { didSet { updateInnerShadow() } }
    @IBInspectable public var innerShadowColor: UIColor = .black    { didSet { updateInnerShadow() } }
    @IBInspectable public var innerShadowOffset: CGSize = .zero     { didSet { updateInnerShadow() } }
    @IBInspectable public var innerShadowOpacity: Float = 0.2       { didSet { updateInnerShadow() } }
    @IBInspectable public var innerShadowRadius: CGFloat = 3        { didSet { updateInnerShadow() } }
    
    @IBInspectable var isMaskedCornerRadius     : Bool = false { didSet { updateLayerMask() } }
    @IBInspectable var roundedTopLeftCorner     : Bool = false { didSet { updateLayerMask() } }
    @IBInspectable var roundedTopRightCorner    : Bool = false { didSet { updateLayerMask() } }
    @IBInspectable var roundedBottomLeftCorner  : Bool = false { didSet { updateLayerMask() } }
    @IBInspectable var roundedBottomRightCorner : Bool = false { didSet { updateLayerMask() } }
    
    // MARK: - Override methods
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateRounded()
        updateInnerShadow()
    }
    
    // MARK: Private methods
    
    private func updateRounded() {
        guard isRounded else { return }
        layer.cornerRadius = frame.height / 2
    }
    
    private func updateInnerShadow() {
        guard innerShadow == true else {
            innerShadowLayer?.removeFromSuperlayer()
            innerShadowLayer = nil
            return
        }
        if innerShadowLayer == nil {
            innerShadowLayer = CALayer()
            layer.addSublayer(innerShadowLayer!)
        }
        innerShadowLayer!.frame = bounds
        let path = UIBezierPath(roundedRect: innerShadowLayer!.bounds, cornerRadius: innerShadowLayer!.bounds.width / 2)
        let cutout = UIBezierPath(rect: innerShadowLayer!.bounds.insetBy(dx: -innerShadowRadius * 2, dy: -innerShadowRadius * 2)).reversing()
        path.append(cutout)
        innerShadowLayer!.shadowPath = path.cgPath
        innerShadowLayer!.masksToBounds = true
        innerShadowLayer!.shadowColor = innerShadowColor.cgColor
        innerShadowLayer!.shadowOffset = innerShadowOffset
        innerShadowLayer!.shadowOpacity = innerShadowOpacity
        innerShadowLayer!.shadowRadius = innerShadowRadius
        innerShadowLayer!.cornerRadius = innerShadowLayer!.bounds.width / 2
    }
    
    private func updateLayerMask() {
        guard isMaskedCornerRadius == true else { return }

        var corners: UIRectCorner = []

        if roundedTopLeftCorner     { corners = corners.union(.topLeft) }
        if roundedTopRightCorner    { corners = corners.union(.topRight) }
        if roundedBottomLeftCorner  { corners = corners.union(.bottomLeft) }
        if roundedBottomRightCorner { corners = corners.union(.bottomRight) }
        
        clipsToBounds = true
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
}
