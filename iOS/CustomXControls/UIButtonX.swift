//
//  DesignableButton.swift
//  SkyApp
//
//  Created by Mark Moeykens on 12/18/16.
//  Copyright © 2016 Mark Moeykens. All rights reserved.
//

import UIKit

@IBDesignable
class UIButtonX: UIButton {
    
    
    
    enum FromDirection: Int {
        case Top = 0
        case Right = 1
        case Bottom = 2
        case Left = 3
    }
    
    var shadowView: UIView!
    var direction: FromDirection = .Left
    var alphaBefore: CGFloat = 1
    
    @IBInspectable var animate: Bool = false
    @IBInspectable var animateDelay: Double = 0.2
    @IBInspectable var animateFrom: Int {
        get {
            return direction.rawValue
        }
        set (directionIndex) {
            direction = FromDirection(rawValue: directionIndex) ?? .Left
        }
    }
    
    @IBInspectable var popIn: Bool = false
    @IBInspectable var popInDelay: Double = 0.4
    
    
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        
        if Language.currentLanguage() == "ar" {
            self.imageEdgeInsets.left = 10
        }  else {
            self.imageEdgeInsets.left = -10
        }
        
        if animate {
            let originalFrame = frame
            
            if direction == .Bottom {
                frame = CGRect(x: frame.origin.x, y: frame.origin.y + 200, width: frame.width, height: frame.height)
            }
            
            UIView.animate(withDuration: 0.3, delay: animateDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.frame = originalFrame
            }, completion: nil)
        }
        
        if popIn {
            transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.8, delay: popInDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
        
        if shadowView == nil && shadowOpacity > 0 {
            shadowView = UIView(frame: self.frame)
            shadowView.backgroundColor = UIColor.clear
            shadowView.layer.shadowColor = shadowColor.cgColor
            shadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
            shadowView.layer.shadowOffset = shadowOffset
            shadowView.layer.shadowOpacity = Float(shadowOpacity)
            shadowView.layer.shadowRadius = shadowRadius
            shadowView.layer.masksToBounds = true
            shadowView.clipsToBounds = false
            
            self.superview?.addSubview(shadowView)
            self.superview?.bringSubviewToFront(self)
        }
        
    }
    
//    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        alphaBefore = alpha
//
//        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction, animations: {
//            self.alpha = 0.4
//        })
//
//        return true
//    }
//
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        UIView.animate(withDuration: 0.35, delay: 0, options: .allowUserInteraction, animations: {
//            self.alpha = self.alphaBefore
//        })
//        setNeedsDisplay()
//    }
    
    // MARK: - Gradient
    @IBInspectable var vedetta_gradiant_button: Bool = false {
        didSet {
            if vedetta_gradiant_button {
                firstColor = .mainColor
                secondColor = .kgreenColor
                verticalGradientStartPoint = CGPoint(x: -0.15, y: 0.5)
                verticalGradientEndPoint = CGPoint(x: 1, y: 0.5)
                horizontalGradient = false
//                verticalGradientStartPoint = CGPoint(x: 0, y: 0.5)
//                verticalGradientEndPoint = CGPoint(x: 0.7, y: 0.5)
            }
        }
    }
    
    
    @IBInspectable var horizontalGradientStartPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var horizontalGradientEndPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var verticalGradientStartPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var verticalGradientEndPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
        
        if (horizontalGradient) {
            layer.startPoint = horizontalGradientStartPoint //CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = horizontalGradientEndPoint //CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = verticalGradientStartPoint//CGPoint(x: 0, y: 0)
            layer.endPoint =  verticalGradientEndPoint//CGPoint(x: 0, y: 0.5)
        }
    }
    
    
    
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
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: CGFloat = 0
    @IBInspectable public var shadowColor: UIColor = UIColor.clear
    @IBInspectable public var shadowRadius: CGFloat = 0
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    
    
    
    // MARK:- helper functions
    
    func setupDefaultShadow() {
        shadowColor = UIColor.black
        shadowRadius = 10
        shadowOpacity = 0.3
        shadowOffset = CGSize(width: 0.5, height: -0.5)
    }
    
}


class CustomSocailMediaButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        tintColor = .white
        
        if Language.currentLanguage() == "ar" {
            self.imageEdgeInsets.left = 30
        }  else {
            self.imageEdgeInsets.left = -30
        }
    }
 
}
