//
//  HorizontallyCenteredCollectionViewFlowLayout.swift
//  Tooli
//
//  Created by SAMEH on 4/24/20.
//  Copyright © 2020 Algorithmz. All rights reserved.
//

import UIKit

class HorizontallyCenteredCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let collectionView = self.collectionView,
            let rightmostEdge = attributes.map({ $0.frame.maxX }).max() else { return attributes }

        if collectionView.frame.width <= collectionView.contentSize.width { return attributes }
        
        let contentWidth = rightmostEdge + self.sectionInset.right
        let margin = (collectionView.bounds.width - contentWidth) / 2

        if margin > 0 {
            let newAttributes: [UICollectionViewLayoutAttributes]? = attributes
                .compactMap {
                    let newAttribute = $0.copy() as? UICollectionViewLayoutAttributes
                    newAttribute?.frame.origin.x += margin
                    return newAttribute
            }

            return newAttributes
        }

        return attributes
    }
}

class FlipableHorizontallyCenteredCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let collectionView = self.collectionView,
            let rightmostEdge = attributes.map({ $0.frame.maxX }).max() else { return attributes }

        let contentWidth = rightmostEdge + self.sectionInset.right
        let margin = (collectionView.bounds.width - contentWidth) / 2

        if margin > 0 {
            let newAttributes: [UICollectionViewLayoutAttributes]? = attributes
                .compactMap {
                    let newAttribute = $0.copy() as? UICollectionViewLayoutAttributes
                    if Language.currentLanguage().contains("ar") {
                        newAttribute?.frame.origin.x -= margin
                    } else {
                        newAttribute?.frame.origin.x += margin
                    }
                    return newAttribute
            }

            return newAttributes
        }

        return attributes
    }
    
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return false
    }
}

extension UICollectionView {
    func updateSemantic() {
        self.semanticContentAttribute = Language.currentLanguage().contains("ar") ? .forceRightToLeft : .forceLeftToRight
    }
}
