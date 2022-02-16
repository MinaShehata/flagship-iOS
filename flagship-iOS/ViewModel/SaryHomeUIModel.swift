//
//  SaryHomeUIModel.swift
//  flagship-iOS
//
//  Created by Mina on 15/02/2022.
//

import Foundation

enum SaryHomeUIModel {
    case loading
    case banner(banners: [Banner])
    case section(route: SaryHomeSectionType, basket: Basket)
    case error(error: FlagShipError)
    
    var isLoading: Bool {
        guard case .loading = self else { return false }
        return true
    }
    
    var banners: [Banner] {
        guard case let .banner(banners) = self else { return [] }
        return banners
    }
}

extension SaryHomeUIModel: Equatable {
    static func == (lhs: SaryHomeUIModel, rhs: SaryHomeUIModel) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.banner, .banner):
            return true
        case (let .section(_, lhsBasket), let .section(_, rhsBasket)):
            return lhsBasket.id == rhsBasket.id
        case (.error(_), .error(_)):
            return true
        default: return false
        }
    }
    
    
}
