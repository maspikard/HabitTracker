//
//  MainViewController.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 14/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: - Private properties

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerNib(of: HabitTableViewCell.self)
        }
    }
    
    private var habits: [Habit] = [] { didSet { tableView.reloadData() } }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHabits()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TestSegue", let editController = segue.destination as? HabitViewController {
            editController.delegate = self
        }
    }
    
    // MARK: - Private methods
    
    private func fetchHabits() {
        CloudKitManager.shared.fetchRecords(success: { [weak self] (habits: [Habit]?) in
            self?.habits = habits ?? []
        })
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HabitTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(with: habits[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - HabitViewControllerDelegate

extension MainViewController: HabitViewControllerDelegate {
    
    func saveHabit(with name: String) {
        CloudKitManager.shared.save(model: Habit(name: name), success: { [weak self] in
            self?.fetchHabits()
        })
    }
}
