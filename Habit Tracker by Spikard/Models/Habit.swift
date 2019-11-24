//
//  Habit.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 14/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

class Habit {
    
    var progress: CGFloat = 0.0
    
    init(progress: CGFloat) {
        self.progress = progress
    }
    
    var progressDiff: CGFloat {
        return 0.05
    }
    
    func updateProgress(test: Bool) {
        progress += progressDiff
    }
}
