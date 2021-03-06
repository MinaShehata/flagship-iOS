//
//  SaryCoordinator.swift
//  flagship-iOS
//
//  Created by Mina on 15/02/2022.
//

import UIKit

final class SaryCoordinator {
        
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return SaryNavigationController(rootViewController: SaryHomeViewController(viewModel: SaryHomeViewModel(service: APIService())))
    }()
    

    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        guard let window = window else {
            return
        }
        Localizer.doExchange()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    
}
