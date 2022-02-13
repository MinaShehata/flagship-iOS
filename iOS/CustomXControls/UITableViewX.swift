//
//  UITableViewX.swift
//  Eschima-iOS
//
//  Created by Mina Shehata on 19/05/2021.
//  Copyright © 2021 Mina Shehata Gad. All rights reserved.
//

import UIKit

class UITableViewX: UITableView {
    
    // MARK: - Borders
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
}
