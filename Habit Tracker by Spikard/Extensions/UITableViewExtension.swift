//
//  UITableViewExtension.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 23.11.2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    public func registerNib<T>(of: T.Type) where T: UITableViewCell {
        register(UINib(nibName: String(describing: T.self), bundle: .main), forCellReuseIdentifier: String(describing: T.self))
    }
}
