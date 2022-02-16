//
//  SaryNavigationController.swift
//  flagship-iOS
//
//  Created by Mina on 16/02/2022.
//

import UIKit

class SaryNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    private func setupUI() {
        navigationBar.backgroundColor = .white
        navigationBar.tintColor = .kblackColor
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
    }
}
