//
//  MainViewController.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 14/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Private properties

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.collectionViewLayout = ColumnsFlowLayout(numberOfColumns: numberOfColumns, aspectRatio: 14/18, minimumInteritemSpacing: 24, minimumLineSpacing: 24, sectionInset: UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24))
        }
    }
    
    private var numberOfColumns: Int {
        return Int(UIScreen.main.bounds.width / 130)
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HabitCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setup(with: Habit())
        return cell
    }
}

