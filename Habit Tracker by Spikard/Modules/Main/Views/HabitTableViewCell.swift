//
//  HabitTableViewCell.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 31/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

enum HabitState {
    case done, notDone
}

// MARK: - HabitTableViewCell

final class HabitTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var iconContainerView: UIView!
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var progressBar: LovelyLinearProgressBar!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var progressLabel: UILabel!
    
    private var state: HabitState = .notDone { didSet { updateState() } }
    private var habit: Habit? = nil          { didSet { updateState() } }
    
    // MARK: - Public methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with habit: Habit) {
        self.habit = habit
    }
    
    // MARK: - Private methods
    
    @IBAction private func confirmButtonTapped(_ sender: Any) {
//        habit?.updateProgress(test: false)
        state = state == .notDone ? .done : .notDone
    }
    
    private func updateState() {
        switch state {
        case .notDone:
            iconContainerView.borderColor = .progressRedColor
            confirmButton.backgroundColor = .progressTranslucentRedColor
            iconImageView.tintColor = .progressRedColor
            progressBar.progressColor = .progressTranslucentRedColor
            progressBar.trackBorderColor = .progressRedColor
            progressLabel.textColor = .progressRedColor
            nameLabel.textColor = .progressRedColor
        case .done:
            iconContainerView.borderColor = .progressGreenColor
            confirmButton.backgroundColor = .progressTranslucentGreenColor
            iconImageView.tintColor = .progressGreenColor
            progressBar.progressColor = .progressTranslucentGreenColor
            progressBar.trackBorderColor = .progressGreenColor
            progressLabel.textColor = .progressGreenColor
            nameLabel.textColor = .progressGreenColor
        }
        nameLabel.text = habit?.name
        progressBar.progress = Double(habit?.progress ?? 0)
        progressLabel.text = Int(round(progressBar.progress * 100)).description + " %"
    }
}
