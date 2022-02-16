//
//  Basket.swift
//  flagship-iOS
//
//  Created by Mina on 15/02/2022.
//

import Foundation


struct BasketResponse: Codable {
    let result: [Basket]
    let status: Bool
}

struct Basket: Codable {
    let id: Int?
    let title: String?
    let data: [BasketItem]
    let dataType: String?
    let showTitle: Bool?
    let uiType: String?
    let rowCount: Int?
}


struct BasketItem: Codable {
    let group_id: Int?
    let name: String?
    let image: String?
    let emptyContentMessage: String?
    let hasData: Bool?
    let showUnavailableItems: Bool?
    let showInBrochureLink: Bool?
}
