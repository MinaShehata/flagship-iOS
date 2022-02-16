//
//  SarySectionViewModel.swift
//  flagship-iOS
//
//  Created by Mina on 15/02/2022.
//

import RxCocoa

final class SarySectionViewModel: SarySectionViewModelProtocol {
    //MARK:- Attributes
    private let banners: [Banner]
    private let basket: [BasketItem]
    private let title: String
    private let type: SaryHomeSectionType

    let bannerUIModel = PublishRelay<[Banner]>()
    let basketUIModel = PublishRelay<[BasketItem]>()
    
    var getTitle: String {
        return title
    }
    //MARK:- Init
    init(banners: [Banner], type: SaryHomeSectionType) {
        self.banners = banners
        self.basket = []
        self.title = ""
        self.type = type
    }
    init(title: String, basket: [BasketItem], type: SaryHomeSectionType) {
        self.basket = basket
        self.banners = []
        self.title = title
        self.type = type
    }
    
    // Configure Binding
    func attach() {
        switch type {
        case .featuredBanner:
            bannerUIModel.accept(banners)
        case .banner, .group, .smart:
            basketUIModel.accept(basket)
        }
    }
    
}
