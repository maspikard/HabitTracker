//
//  LovelyLinearProgressBar.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 27/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

@IBDesignable
public final class LovelyLinearProgressBar: View {
    
    // MARK: - Private properties
    
    private var trackView: View!
    private var progressView: View!
    
    // MARK: - Public properties
    
    @IBInspectable public var trackColor: UIColor = .clear          { didSet { trackView.backgroundColor = trackColor } }
    @IBInspectable public var progressColor: UIColor = .magenta     { didSet { progressView.backgroundColor = progressColor } }
    @IBInspectable public var trackCornerRadius: CGFloat = 8        { didSet { updateCornerRadius() } }
    @IBInspectable public var trackBorderWidth: CGFloat = 0.5       { didSet { trackView.borderWidth = trackBorderWidth } }
    @IBInspectable public var trackBorderColor: UIColor = .magenta  { didSet { trackView.borderColor = trackBorderColor } }
    
    @IBInspectable public var progress: Double = 0.5 { didSet { updateProgress() } }
    
    // MARK: - Override methods
    
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
        
        // track view
        
        if trackView == nil {
            trackView = View()
            addSubview(trackView)
        }
        trackView.frame = CGRect(origin: .zero, size: frame.size)
        trackView.backgroundColor = trackColor
        trackView.borderWidth = trackBorderWidth
        trackView.borderColor = trackBorderColor
        trackView.cornerRadius = trackCornerRadius
        trackView.isMaskedCornerRadius = true
        trackView.roundedTopRightCorner = true
        trackView.roundedBottomRightCorner = true
        
        // progress view
        
        if progressView == nil {
            progressView = View()
            addSubview(progressView)
        }
        progressView.backgroundColor = progressColor
        progressView.cornerRadius = trackCornerRadius
        progressView.isMaskedCornerRadius = true
        progressView.roundedTopRightCorner = true
        progressView.roundedBottomRightCorner = true
        
        // update progress
        
        updateProgress()
    }
    
    private func updateCornerRadius() {
        trackView.cornerRadius = trackCornerRadius
        progressView.cornerRadius = trackCornerRadius
    }
    
    private func updateProgress() {
        progressView.frame = CGRect(x: 0, y: 0, width: frame.size.width * CGFloat(progress), height: frame.size.height)
    }
}
