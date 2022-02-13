//
//  GradiantBars+Extension.swift
//  Medica-Egypt-iOS
//
//  Created by Mina Shehata on 1/22/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit



extension UINavigationBar {
    
    @discardableResult
    func applyNavigationBarGradiant() -> UIColor {
        
        var updatedFrame = self.bounds
        // take into account the status bar
        updatedFrame.size.height += 40
        let layer = CAGradientLayer.gradientLayerForBounds(bounds: updatedFrame)
        UIGraphicsBeginImageContext(layer.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image!)
    }
    
    
    
    func applyNavigationBarGradiant(components: GradiantComponent) {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 1)
        let gradiant = CAGradientLayer()
        gradiant.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        gradiant.colors = components.colors
        gradiant.startPoint = components.startPoint
        gradiant.endPoint = components.endPoint
        gradiant.locations = components.locations

        UIGraphicsBeginImageContext(gradiant.bounds.size)
        gradiant.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UINavigationBar.appearance().barTintColor = UIColor(patternImage: image!)
        
    }
    
}
extension CAGradientLayer {
    class func gradientLayerForBounds(bounds: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [UIColor.mainColor.cgColor, UIColor.mainColor.cgColor]
        return layer
    }
}

extension UITabBar {
    func applyNavigationBarGradiant(components: GradiantComponent) {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 1)
        let gradiant = CAGradientLayer()
        gradiant.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        gradiant.colors = components.colors
        gradiant.startPoint = components.startPoint
        gradiant.endPoint = components.endPoint
        gradiant.locations = components.locations
        
        UIGraphicsBeginImageContext(gradiant.bounds.size)
        gradiant.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        barTintColor = UIColor(patternImage: image!)
    }
    
}

struct GradiantComponent {
    var colors: [CGColor]
    var locations: [NSNumber]
    var startPoint: CGPoint
    var endPoint: CGPoint
}

