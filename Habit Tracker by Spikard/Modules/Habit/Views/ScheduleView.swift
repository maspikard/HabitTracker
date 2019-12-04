//
//  ScheduleView.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 02.12.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

enum ScheduleCategory: Int, CaseIterable {
    case everyDay = 0, everyWeek, everyMonth
}

enum ScheduleSubCategory: Int, CaseIterable {
    case days = 0, periodicity
}

// MARK: - ScheduleView

@IBDesignable
final class ScheduleView: NibView {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var scheduleStackView: UIStackView!
    
    @IBOutlet private weak var scheduleCategoryContainerView: UIView!
    @IBOutlet private weak var scheduleSubCategoryContainerView: UIView!
    @IBOutlet private weak var daysStackView: UIStackView!
    @IBOutlet private weak var periodicityCollectionView: UICollectionView! {
        didSet {
            periodicityCollectionView.registerNib(of: PeriodicityCollectionViewCell.self)
            let collectionViewLayout = CollectionViewColumnsFlowLayout()
            collectionViewLayout.columns = UIDevice.current.userInterfaceIdiom == .pad ? 12 : 6
            periodicityCollectionView.collectionViewLayout = collectionViewLayout
        }
    }
    
    @IBOutlet private weak var scheduleCategoryLabel: UILabel!
    
    @IBOutlet private weak var prevButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    
    @IBOutlet private weak var daysSubCategoryButton: UIButton!
    @IBOutlet private weak var periodicitySubCategoryButton: UIButton!
    
    private var scheduleCategory: ScheduleCategory = .everyDay { didSet { updateScheduleCategory() } }
    private var scheduleSubCategory: ScheduleSubCategory = .days { didSet { updateScheduleSubCategory() } }
    
    // MARK: - Public methods
    
    func setup(with schedule: Int?) {
        scheduleCategory = .everyDay
        scheduleSubCategory = .days
    }
    
    // MARK: - Private methods
    
    private func updateScheduleCategory() {
        switch scheduleCategory {
        case .everyDay:
            scheduleSubCategoryContainerView.isHidden = true
            daysStackView.isHidden = true
            periodicityCollectionView.isHidden = true
            scheduleCategoryLabel.text = NSLocalizedString("Every day", comment: "").uppercased()
        case .everyWeek:
            scheduleSubCategoryContainerView.isHidden = false
            daysSubCategoryButton.isHidden = false
            switch scheduleSubCategory {
            case .days:
                daysStackView.isHidden = false
                periodicityCollectionView.isHidden = true
            case .periodicity:
                daysStackView.isHidden = true
                periodicityCollectionView.isHidden = false
            }
            scheduleCategoryLabel.text = NSLocalizedString("Every week", comment: "").uppercased()
        case .everyMonth:
            scheduleSubCategoryContainerView.isHidden = false
            daysSubCategoryButton.isHidden = true
            daysStackView.isHidden = true
            periodicityCollectionView.isHidden = false
            scheduleCategoryLabel.text = NSLocalizedString("Every month", comment: "").uppercased()
        }
        periodicityCollectionView.reloadData()
    }
    
    private func updateScheduleSubCategory() {
        switch scheduleSubCategory {
        case .days:
            daysSubCategoryButton.backgroundColor = .progressTranslucentGreenColor
            periodicitySubCategoryButton.backgroundColor = .clear
        case .periodicity:
            daysSubCategoryButton.backgroundColor = .clear
            periodicitySubCategoryButton.backgroundColor = .progressTranslucentGreenColor
        }
        updateScheduleCategory()
    }
    
    @IBAction private func prevScheduleCategoryButtonTapped(_ sender: Any) {
        guard let scheduleCategory = ScheduleCategory(rawValue: scheduleCategory.rawValue - 1) else { return }
        self.scheduleCategory = scheduleCategory
        updateScheduleSubCategoryIfNeeded()
    }
    
    @IBAction private func nextScheduleCategoryButtonTapped(_ sender: Any) {
        guard let scheduleCategory = ScheduleCategory(rawValue: scheduleCategory.rawValue + 1) else { return }
        self.scheduleCategory = scheduleCategory
        updateScheduleSubCategoryIfNeeded()
    }
    
    @IBAction func daysSubCategoryButtonTapped(_ sender: Any) {
        guard scheduleSubCategory != .days else { return }
        scheduleSubCategory = .days
    }
    
    @IBAction func periodicitySubCategoryButtonTapped(_ sender: Any) {
        guard scheduleSubCategory != .periodicity else { return }
        scheduleSubCategory = .periodicity
    }
    
    private func updateScheduleSubCategoryIfNeeded() {
        if scheduleCategory == .everyMonth && scheduleSubCategory == .days {
            scheduleSubCategory = .periodicity
        }
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate

extension ScheduleView: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch scheduleSubCategory {
        case .days              : return 0
        case .periodicity:
            switch scheduleCategory {
            case .everyDay      : return 0
            case .everyWeek     : return 6
            case .everyMonth    : return 12
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PeriodicityCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setup(with: indexPath.row + 1, isChosen: false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PeriodicityCollectionViewCell
        cell.isChosen = !cell.isChosen
    }
}
