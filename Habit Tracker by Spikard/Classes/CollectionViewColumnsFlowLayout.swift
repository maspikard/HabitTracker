//
//  CollectionViewColumnsFlowLayout.swift
//  Habit Tracker by Spikard
//
//  Created by maxial on 27/08/2019.
//  Copyright © 2019 Spikard. All rights reserved.
//

import UIKit

// MARK: - CollectionViewColumnsFlowLayout

final class CollectionViewColumnsFlowLayout: UICollectionViewFlowLayout {
    
    // MARK: - Public properties
    
    @IBInspectable var columns: Int = 3
    @IBInspectable var aspectRatio: CGFloat = 1
    
    @IBInspectable var minInteritemSpacing: CGFloat = 0 { didSet { minimumInteritemSpacing = minInteritemSpacing } }
    @IBInspectable var minLineSpacing: CGFloat = 0      { didSet { minimumLineSpacing = minLineSpacing } }
    
    // MARK: - Override methods
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let horizontalInsets = sectionInset.left + sectionInset.right + minimumInteritemSpacing * CGFloat(columns - 1)
        let width = ((collectionView.bounds.size.width - horizontalInsets) / CGFloat(columns)).rounded(.down)
        let height = width / aspectRatio
        
        itemSize = CGSize(width: width, height: height)
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
}
