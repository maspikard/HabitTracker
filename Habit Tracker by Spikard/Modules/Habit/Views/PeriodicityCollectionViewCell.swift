//
//  PeriodicityCollectionViewCell.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 02.12.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

// MARK: - PeriodicityCollectionViewCell

final class PeriodicityCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var periodicityLabel: UILabel!
    
    // MARK: - Public properties
    
    var isChosen: Bool = false { didSet { backView.backgroundColor = isChosen ? .progressTranslucentGreenColor : .clear } }
    
    // MARK: - Public methods

    func setup(with periodicity: Int, isChosen: Bool) {
        periodicityLabel.text = periodicity.description
        self.isChosen = isChosen
    }
}
