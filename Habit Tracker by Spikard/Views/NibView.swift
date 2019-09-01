//
//  NibView.swift
//  ScienceApp
//
//  Created by Maxim Aliev on 22/09/2018.
//  Copyright © 2018 maxial. All rights reserved.
//

import UIKit

@IBDesignable
class NibView: View {
    
    // MARK: - Public properties
    
    var view: UIView!
    
    // MARK: - Override methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
        setup()
    }
    
    func setup() {
        
    }
    
    // MARK: - Private methods
    
    private func loadView() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: Bundle(for: NibView.self))
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
