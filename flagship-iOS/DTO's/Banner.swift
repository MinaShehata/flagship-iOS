//
//  Banner.swift
//  flagship-iOS
//
//  Created by Mina on 13/02/2022.
//

import Foundation


struct BannerResponse: Codable {
    let result: [Banner]
    let status: Bool
}

struct Banner: Codable {
    let id: Int
    let title: String
    let buttonText: String
    let expiryStatus: Bool
    let createdAt: String
    let startDate: String
    let image: String
    let priority: Int
    let photo: String
    let link: String
    let level: String
}
