//
//  HabitView.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 14/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

final class HabitView: NibView {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var habitImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Public methods
    
    func setup(with habit: Habit) {
        
    }
}
