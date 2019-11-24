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
    
    private var contentLayer: CAShapeLayer?
    private var progressLabel: UILabel?
    
    private var progressAnimationDuration: TimeInterval = 0.3
    private var steps: Int = 255
    
    // MARK: - Public properties
    
    @IBInspectable public var trackLineWidth: CGFloat = 10      { didSet { setNeedsDisplay() } }
    @IBInspectable public var progressLineWidth: CGFloat = 10   { didSet { setNeedsDisplay() } }
    @IBInspectable public var trackColor: UIColor = .lightGray  { didSet { setNeedsDisplay() } }
    @IBInspectable public var progressColor: UIColor = .magenta { didSet { setNeedsDisplay() } }
    
    @IBInspectable public var progressTextColor: UIColor = .black       { didSet { updateProgressLabel() } }
    @IBInspectable public var progressTextCenterYConstant: CGFloat = 0  { didSet { updateProgressLabel() } }
    public var progressTextFont: UIFont = .systemFont(ofSize: 13)       { didSet { updateProgressLabel() } }
    
    @IBInspectable public var progress: CGFloat = 0.5 { didSet { updateProgress() } }
    
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
    
    public override func draw(_ rect: CGRect) {
        let radius = (min(frame.width, frame.height) - max(trackLineWidth, progressLineWidth)) / 2

        let circlePath = UIBezierPath.circle(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: radius)
        circlePath.lineWidth = progressLineWidth
        circlePath.lineCapStyle = .butt
        trackColor.setStroke()
        circlePath.stroke()

        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        let progressSteps = Int(CGFloat(steps) * progress)
        for i in 1...progressSteps {
            let startAngle = CGFloat.pi * (2 * (CGFloat(i) - 1) / CGFloat(steps) - 0.5)
            let endAngle = CGFloat.pi * (2 * CGFloat(i) / CGFloat(steps) - 0.5)

            let path = UIBezierPath()
            path.lineWidth = progressLineWidth
            path.lineCapStyle = .round
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            progressColor.setStroke()
            path.stroke()
        }
    }
    
    // MARK: - Private methods
    
    private func setup() {
        backgroundColor = .clear

        if contentLayer == nil {
            contentLayer = CAShapeLayer()
            layer.addSublayer(contentLayer!)
        }
        let radius = min(frame.width, frame.height) / 2 - max(trackLineWidth, progressLineWidth)
        contentLayer!.path = UIBezierPath.circle(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: radius).cgPath
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
        updateProgressLabel()
    }
    
    private func updateProgress() {
        setNeedsDisplay()
        updateProgressLabel()
    }
    
    private func updateProgressLabel() {
        progressLabel?.text = "\(Int(progress * 100))%"
        progressLabel?.font = progressTextFont
        progressLabel?.textColor = progressTextColor
        progressLabel?.findConstraint(type: .centerY)?.constant = progressTextCenterYConstant
        setNeedsDisplay()
    }
}
