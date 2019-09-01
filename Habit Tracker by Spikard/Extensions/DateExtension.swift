//
//  DateExtension.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 27/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import Foundation

extension Date {
    
    static private let dateFormatter = DateFormatter()
    
    static func date(daysBefore: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -daysBefore, to: Date())!
    }
    
    static func date(daysAfter: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: daysAfter, to: Date())!
    }
    
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var weekday: String? {
        Date.dateFormatter.dateFormat = "EEEEEE"
        return Date.dateFormatter.string(from: self).capitalized
    }
}
