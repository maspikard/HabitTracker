//
//  Habit.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 14/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit
import CloudKit

final class Habit: CKModel {
    
    static var recordType: String = "Habits"
    
    var name: String
    var progress: CGFloat
    
    var record: CKRecord {
        let record = CKRecord(recordType: Habit.recordType)
        record.setObject(name as NSString, forKey: "name")
        return record
    }
    
    init(name: String, progress: CGFloat = 0.0) {
        self.name = name
        self.progress = progress
    }
    
    convenience init(with record: CKRecord) {
        self.init(name: (record.value(forKey: "name") as? String) ?? "")
    }
    
//    var progressDiff: CGFloat {
//        return 0.05
//    }
//
//    func updateProgress(test: Bool) {
//        progress += progressDiff
//    }
}
