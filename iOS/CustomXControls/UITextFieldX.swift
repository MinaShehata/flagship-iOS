//
//  DesignableUITextField.swift
//  SkyApp
//
//  Created by Mark Moeykens on 12/16/16.
//  Copyright © 2016 Mark Moeykens. All rights reserved.
//

import UIKit

@IBDesignable
class UITextFieldX: UITextField {
    
    @IBInspectable var placeholderColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    
    // MARK: - Borders
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            //layer.masksToBounds = cornerRadius > 0
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
    
    @IBInspectable var text_alignment: NSTextAlignment = (Language.currentLanguage().contains("ar") ? .right : .left) {
           didSet {
               textAlignment = text_alignment
           }
       }
    
    private var _isRightViewVisible: Bool = true
    var isRightViewVisible: Bool {
        get {
            return _isRightViewVisible
        }
        set {
            _isRightViewVisible = newValue
            updateView()
        }
    }
    
    func updateView() {
        setLeftImage()
        setRightImage()
        textAlignment = Language.currentLanguage().contains("ar") ? .right : .left
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    func setLeftImage() {
        leftViewMode = UITextField.ViewMode.always
        var view: UIView
        
        if let image = leftImage {
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            let width: CGFloat = 30 + leftPadding
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
//                width += leftPadding
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width , height: 20))
            view.addSubview(imageView)
        } else {
            view = UIView(frame: CGRect(x: leftPadding, y: 0, width: leftPadding, height: 20))
        }
        
        leftView = view
    }
    
    func setRightImage() {
        rightViewMode = UITextField.ViewMode.always
        
        var view: UIView

        if let image = rightImage, isRightViewVisible {
            let imageView = UIImageView(frame: CGRect(x: Language.currentLanguage() == "ar" ? rightPadding : 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
           
            var width = image.size.width + rightPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 10
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 20))
        }
        
        rightView = view
    }
    
    
    // MARK:- helper functions
    
    func setupDefaultShadow() {
        shadowColor = .black
        shadowRadius = 3
        shadowOpacity = 0.4
        shadowOffset = CGSize(width: 0.5, height: 0.5)
    }
    
}

