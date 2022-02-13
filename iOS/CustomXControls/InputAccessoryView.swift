//
//  InputAccessoryView.swift
//  Vootly-iOS
//
//  Created by Mina Shehata on 6/5/19.
//  Copyright © 2019 Vootly. All rights reserved.
//

import UIKit
//import IQKeyboardManagerSwift

class InputAccessoryView: UIView {
//    var textView: IQTextView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        // This is required to make the view grow vertically
        self.autoresizingMask = .flexibleHeight
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        get {
//            let textSize = self.textView.sizeThatFits(CGSize(width: self.textView.bounds.width, height: CGFloat.greatestFiniteMagnitude))
//            return CGSize(width: self.bounds.width, height: textSize.height)
//        }
//    }
}
