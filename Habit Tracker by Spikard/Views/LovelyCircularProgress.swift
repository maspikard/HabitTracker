//
//  LovelyCircularProgress.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 31/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

// MARK: - LovelyCircularProgress

@IBDesignable
public final class LovelyCircularProgress: View {
    
    // MARK: - Private properties
    
    private var trackLayer: CAShapeLayer?
    private var progressLayer: CAShapeLayer?
    private var contentLayer: CAShapeLayer?
    private var progressLabel: UILabel?
    
    private var progressAnimationDuration: TimeInterval = 0.3
    
    // MARK: - Public properties
    
    @IBInspectable public var trackLineWidth: CGFloat = 10          { didSet { trackLayer?.lineWidth = trackLineWidth } }
    @IBInspectable public var progressLineWidth: CGFloat = 10       { didSet { progressLayer?.lineWidth = progressLineWidth } }
    @IBInspectable public var trackColor: UIColor = .lightGray      { didSet { trackLayer?.strokeColor = trackColor.cgColor } }
    @IBInspectable public var progressColor: UIColor = .magenta     { didSet { progressLayer?.strokeColor = progressColor.cgColor } }
    @IBInspectable public var progressTextColor: UIColor = .black   { didSet { progressLabel?.textColor = progressTextColor } }
    
    public var progressTextFont: UIFont = .systemFont(ofSize: 13)
    
    @IBInspectable public var progress: CGFloat = 0                 { didSet { updateProgressLayer() } }
    
    // MARK: - Public methods
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        backgroundColor = .clear
        
        let radius = (min(frame.width, frame.height) - max(trackLineWidth, progressLineWidth)) / 2
        let circlePath = UIBezierPath.circle(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: radius)
        
        if trackLayer == nil {
            trackLayer = CAShapeLayer()
            layer.addSublayer(trackLayer!)
        }
        trackLayer!.path = circlePath.cgPath
        trackLayer!.fillColor = UIColor.clear.cgColor
        trackLayer!.strokeColor = trackColor.cgColor
        trackLayer!.lineWidth = trackLineWidth
        trackLayer!.strokeEnd = 1.0
        
        if progressLayer == nil {
            progressLayer = CAShapeLayer()
            layer.addSublayer(progressLayer!)
        }
        progressLayer!.path = circlePath.cgPath
        progressLayer!.fillColor = UIColor.clear.cgColor
        progressLayer!.strokeColor = progressColor.cgColor
        progressLayer!.lineWidth = progressLineWidth
        progressLayer!.strokeEnd = 0.0
        progressLayer!.lineCap = .round
        
        if contentLayer == nil {
            contentLayer = CAShapeLayer()
            layer.addSublayer(contentLayer!)
        }
        let contentRadius = min(frame.width, frame.height) / 2 - max(trackLineWidth, progressLineWidth)
        contentLayer!.path = UIBezierPath.circle(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: contentRadius).cgPath
        contentLayer!.fillColor = UIColor.white.cgColor
        contentLayer!.shadowRadius = 3
        contentLayer!.shadowOffset = .zero
        contentLayer!.shadowOpacity = 0.2
        
        if progressLabel == nil {
            progressLabel = UILabel()
            addSubview(progressLabel!)
        }
        progressLabel!.translatesAutoresizingMaskIntoConstraints = false
        progressLabel!.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        progressLabel!.centerYAnchor.constraint(equalTo: centerYAnchor, constant: frame.height / 5).isActive = true
        progressLabel!.textAlignment = .center
        progressLabel!.font = progressTextFont
        progressLabel!.textColor = progressTextColor
        progressLabel!.text = progress.description
    }
    
    private func updateProgressLayer() {
        guard progress >= 0 && progress <= 1 else { return }
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = progressAnimationDuration
        animation.toValue = progress
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        progressLayer?.strokeEnd = progress
        progressLayer?.add(animation, forKey: "strokeEndAnimation")
    }
}
