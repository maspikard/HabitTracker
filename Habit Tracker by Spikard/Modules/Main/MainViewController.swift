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
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Private methods
    
    
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HabitTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(with: Habit(progress: CGFloat(Float(arc4random()) / Float(UINT32_MAX))))
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
