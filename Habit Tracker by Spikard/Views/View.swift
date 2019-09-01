//
//  View.swift
//  ScienceApp
//
//  Created by Maxim Aliev on 22/09/2018.
//  Copyright © 2018 maxial. All rights reserved.
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
}
