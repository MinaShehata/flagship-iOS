//
//  CustomNavigationController.swift
//  IntermediateTraining
//
//  Created by Mina Shehata on 10/8/18.
//  Copyright © 2018 Mina Shehata. All rights reserved.
//

import UIKit

extension UIViewController {
    @discardableResult
    func addRightBarButton(image: UIImage, with selector: Selector) -> UIBarButtonItem{
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: selector)
        navigationItem.rightBarButtonItem = button
        return button
    }
    @discardableResult
    func addRightBarButton(title: String, selector: Selector) -> UIBarButtonItem {
        let rightButton = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
        rightButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightButton
        return rightButton
    }
    
    func addLeftBarButton(title: String, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
    
    func addLeftBarButton(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: selector)
        navigationItem.leftBarButtonItem = button
        return button
    }
    
    func addLeftBarButtons(images: [UIImage], selector: [Selector]) {
        var barButtons = [UIBarButtonItem]()
        for (index, image) in images.enumerated() {
            barButtons.append(UIBarButtonItem(image: image, style: .plain, target: self, action: selector[index]))
        }
        navigationItem.leftBarButtonItems = barButtons
    }
    
    func addRightBarButtons(images: [UIImage], selector: [Selector]) {
        var barButtons = [UIBarButtonItem]()
        for (index, image) in images.enumerated() {
            barButtons.append(UIBarButtonItem(image: image, style: .plain, target: self, action: selector[index]))
        }
        navigationItem.rightBarButtonItems = barButtons
    }
    
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
    
    
    @objc func dismissView() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
