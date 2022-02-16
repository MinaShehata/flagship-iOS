//
//  SarySectionCoordinator.swift
//  flagship-iOS
//
//  Created by Mina on 16/02/2022.
//

import UIKit

final class SarySectionCoordinator {
    let containerVC: UIViewController
    
    init(containerVC: UIViewController) {
        self.containerVC = containerVC
    }
    
    func showBannerViewController(banners: [Banner], parent: UIStackView) {
        let viewModel = SarySectionViewModel(banners: banners, type: .featuredBanner)
        let bannerVC = FeaturedBannerViewController(viewModel: viewModel)
        containerVC.add(child: bannerVC, at: parent)
    }
    
    func showSectionViewController(route: SaryHomeSectionType, basket: Basket, parent: UIStackView) {
        let viewModel = SarySectionViewModel(title: basket.title ?? "", basket: basket.data, type: route)
        switch route {
        case .featuredBanner:
            break
        case .smart:
            let smartVC = SmartBasketViewController(viewModel: viewModel)
            containerVC.add(child: smartVC, at: parent)
        case .group:
            let groupVC = GroupBasketViewController(viewModel: viewModel)
            containerVC.add(child: groupVC, at: parent)
        case .banner:
            let bannerVC = BannerBasketViewController(viewModel: viewModel)
            containerVC.add(child: bannerVC, at: parent)
        }
    }
    
}
