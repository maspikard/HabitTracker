//
//  HabitCollectionViewCell.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 31/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

final class HabitCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var habitView: HabitView!
    
    // MARK: - Public methods
    
    func setup(with habit: Habit) {
        habitView.setup(with: habit)
    }
}
