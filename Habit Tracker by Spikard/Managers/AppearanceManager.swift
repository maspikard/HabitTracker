//
//  AppearanceManager.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 24.11.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

// MARK: - AppearanceManager

public final class AppearanceManager {
    
    static let shared = AppearanceManager()
    
    // MARK: - Private properties
    
    private var tintColor: UIColor { return .mainBackgroundReversedColor }
    private var titleAttributes: [NSAttributedString.Key : Any] { return [.foregroundColor : UIColor.mainBackgroundReversedColor] }
    
    // MARK: - Public methods
    
    func setNavigationBarAppearance() {
        let appearance = UINavigationBar.appearance()
        
        appearance.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        appearance.shadowImage = UIImage()
        
        appearance.backIndicatorImage = #imageLiteral(resourceName: "ArrowBack")
        appearance.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "ArrowBack")
        
        appearance.tintColor = tintColor
        appearance.titleTextAttributes = titleAttributes
        
        if #available(iOS 11.0, *) {
            appearance.prefersLargeTitles = true
            appearance.largeTitleTextAttributes = titleAttributes
        }
    }
}
