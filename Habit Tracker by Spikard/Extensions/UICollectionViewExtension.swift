//
//  UICollectionViewExtension.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 31/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    public func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    public func registerNib<T>(of: T.Type) where T: UICollectionViewCell {
        register(UINib(nibName: String(describing: T.self), bundle: .main), forCellWithReuseIdentifier: String(describing: T.self))
    }
}
