//
//  CloudKitManager.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 30.11.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit
import CloudKit

private let kCloudKitContainerIdentifier = "iCloud.com.spikard.habit-tracker"

public final class CloudKitManager {
    
    static let shared = CloudKitManager()
    
    // MARK: - Private properties
    
    private static let container = CKContainer(identifier: kCloudKitContainerIdentifier)
    
    private let privateDatabase = container.privateCloudDatabase
    
    // MARK: - Public methods
    
    func fetchRecords<T>(success: @escaping ([T]?) -> Void, failed: ((Error) -> Void)? = nil) where T: CKModel {
        let query = CKQuery(recordType: T.recordType, predicate: NSPredicate(value: true))
        
        privateDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                failed?(error!)
                return
            }
            DispatchQueue.main.async {
                success(records?.compactMap{ T(with: $0) })
            }
        }
    }
    
    func save<T>(model: T, success: @escaping () -> Void, failed: ((Error) -> Void)? = nil) where T: CKModel {
        let record = model.record
        
        privateDatabase.save(record) { record, error in
            guard error == nil else {
                failed?(error!)
                return
            }
            success()
        }
    }
    
    func delete<T>(model: T, success: @escaping () -> Void, failed: ((Error) -> Void)? = nil) where T: CKModel {
        
//        privateDatabase.delete(withRecordID: <#T##CKRecord.ID#>, completionHandler: <#T##(CKRecord.ID?, Error?) -> Void#>)
    }
}
