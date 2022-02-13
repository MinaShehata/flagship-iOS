//
//  InterestCollectionFlowLayout.swift
//  Vootly-iOS
//
//  Created by Mina Shehata on 6/20/19.
//  Copyright © 2019 Vootly. All rights reserved.
//

import UIKit

class InterestCollectionFlowLayout: UICollectionViewFlowLayout {

    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
    
    override var developmentLayoutDirection: UIUserInterfaceLayoutDirection {
        return Language.currentLanguage().contains("ar") ? UIUserInterfaceLayoutDirection.rightToLeft : UIUserInterfaceLayoutDirection.leftToRight
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
        
        var leftMargin: CGFloat = self.sectionInset.left
        
        for attributes in attributesForElementsInRect! {
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = attributes.frame
                
                if leftMargin + attributes.frame.width < self.collectionViewContentSize.width {
                    newLeftAlignedFrame.origin.x = leftMargin
                } else {
                    newLeftAlignedFrame.origin.x = self.sectionInset.left
                }
                
                attributes.frame = newLeftAlignedFrame
            }
            leftMargin += attributes.frame.size.width + 8
            newAttributesForElementsInRect.append(attributes)
        }
        
        return newAttributesForElementsInRect
    }
}
