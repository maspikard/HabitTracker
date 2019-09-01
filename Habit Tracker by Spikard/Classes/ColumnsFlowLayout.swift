//
//  ColumnsFlowLayout.swift
//  Anketka
//
//  Created by maxial on 25/07/2019.
//  Copyright © 2019 MobileUp LLC. All rights reserved.
//

import UIKit

final class ColumnsFlowLayout: UICollectionViewFlowLayout {
    
    let numberOfColumns: Int
    let aspectRatio: CGFloat
    
    init(
        
        numberOfColumns: Int,
        aspectRatio: CGFloat = 1,
        minimumInteritemSpacing: CGFloat = 0,
        minimumLineSpacing: CGFloat = 0,
        sectionInset: UIEdgeInsets = .zero
        
    ) {
        self.numberOfColumns = numberOfColumns
        self.aspectRatio = aspectRatio
        
        super.init()
        
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let horizInsets = sectionInset.left + sectionInset.right + minimumInteritemSpacing * CGFloat(numberOfColumns - 1)
        
        let width = ((collectionView.bounds.size.width - horizInsets) / CGFloat(numberOfColumns)).rounded(.down)
        
        let height = width / aspectRatio
        
        itemSize = CGSize(width: width, height: height)
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
}
