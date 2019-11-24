//
//  AppearanceManager.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 24.11.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

public final class AppearanceManager {
    
    static func setNavigationBarAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        appearance.shadowImage = UIImage()
    }
}
