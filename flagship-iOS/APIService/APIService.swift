//
//  APIService.swift
//  flagship-iOS
//
//  Created by Mina on 12/02/2022.
//
import RxSwift

final class APIService: APIServiceProtocol {
    func homeService(completion: @escaping ([Banner]?, [Basket]?, FlagShipError?) -> ()) {
        var featuredBanners: [Banner]?
        var baskets: [Basket]?
        var flagError: FlagShipError?
        let group = DispatchGroup()
        
        group.enter()
        let bannerTask = URLSession.shared.dataTask(with: URL(string: Constants.banners)!) {data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try? decoder.decode(BannerResponse.self, from: data)
                featuredBanners = result?.result
            } else {
                if let error = error as? FlagShipError {
                    flagError = error
                }
            }
            group.leave()
        }
        
        group.enter()
        let basketTask = URLSession.shared.dataTask(with: URL(string: Constants.basket)!) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try? decoder.decode(BasketResponse.self, from: data)
                baskets = result?.result
            } else {
                if let error = error as? FlagShipError {
                    flagError = error
                }
            }
            group.leave()
        }
        
        bannerTask.resume()
        basketTask.resume()
        
        group.notify(queue: .main) {
            completion(featuredBanners, baskets, flagError)
        }
    }
}
