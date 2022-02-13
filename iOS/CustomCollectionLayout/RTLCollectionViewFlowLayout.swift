//
//  RTLCollectionViewFlowLayout.swift
//  Vootly-iOS
//
//  Created by Mina Shehata on 8/9/19.
//  Copyright © 2019 Vootly. All rights reserved.
//

import UIKit

open class RTLCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override open var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
    
    override open var developmentLayoutDirection: UIUserInterfaceLayoutDirection {
        return UIUserInterfaceLayoutDirection.rightToLeft
    }
}
