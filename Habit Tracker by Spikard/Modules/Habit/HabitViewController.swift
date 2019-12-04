//
//  HabitViewController.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 30.11.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

protocol HabitViewControllerDelegate: class {
    
    func saveHabit(with name: String)
}

// MARK: - HabitViewController

final class HabitViewController: UIViewController {
    
    weak var delegate: HabitViewControllerDelegate?
    
    var habit: Habit?
    
    // MARK: - Private properties
    
    @IBOutlet private weak var iconImageView: ImageView!
    @IBOutlet private weak var habitNameTextField: UITextField!
    @IBOutlet private weak var scheduleView: ScheduleView!
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureContent()
    }
    
    // MARK: - Private methods
    
    private func configureNavigationBar() {
        title = habit?.name ?? NSLocalizedString("New Habit", comment: "")
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureContent() {
        iconImageView.image = UIImage(named: "Running")
        scheduleView.setup(with: nil)
    }
    
    @IBAction func changeIconButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction private func saveButtonTapped(_ sender: Any) {
        delegate?.saveHabit(with: habitNameTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
