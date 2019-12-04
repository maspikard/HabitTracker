//
//  CKModel.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 30.11.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import CloudKit

protocol CKModel: class {
    
    static var recordType: String { get }
    var record: CKRecord { get }
    init(with record: CKRecord)
    
}
