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

final class APIServiceStup: APIServiceProtocol {
    var bannerResponse: BannerResponse!
    var basketResponse: BasketResponse!

    func homeService(completion: @escaping ([Banner]?, [Basket]?, FlagShipError?) -> ()) {
        let banners = [ Banner(id: 117, title: "?????? ?????????? ?????????????? ???????????? ! ????", buttonText: "???????? ???????? ??????", expiryStatus: false, createdAt: "2020-06-09", startDate: "09/06/2020", image: "https://devcdn.sary.co/banners/2020/06/09/June_Banners-02.png", priority: 5000, photo: "https://devcdn.sary.co/June_Banners-04.png", link: "sary://sary.com/discount?promocode=hala", level: "global"),  Banner(id: 160, title: "?????? ?????????? ?????????????? ???????????? ! ????", buttonText: "???????? ???????? ??????", expiryStatus: false, createdAt: "2020-09-10", startDate: "10/09/2020", image: "https://devcdn.sary.co/banners/2020/09/11/June_Banners-02.png", priority: 500, photo: "https://devcdn.sary.co/June_Banners-04_g3O64Sc_KCjyWHn.png", link: "sary://sary.com/discount?promocode=hala", level: "global"),  Banner(id: 119, title: "?????????? ???????????? ?????? ??????????! ????", buttonText: "?????????? ???????? ??????????????!", expiryStatus: false, createdAt: "2020-06-15", startDate: "15/06/2020", image: "https://devcdn.sary.co/banners/2020/06/16/banA.png", priority: 200, photo: "https://devcdn.sary.co/phAA.png", link: "sary://sary.com/group?id=248", level: "global")]
       let baskets = [Basket(id: (3), title:  (""), data: [BasketItem(group_id: nil, name:  ("???????????? ??????????"), image:  ("https://devcdn.sary.co/PREV_EyEHEGC.png"), emptyContentMessage:  ("???? ???????? ???????????? ???????????? ???? ??????"), hasData:  (false), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("?????? ??????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/05/01/saving_2gYwSOu.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("?????????? ????????"), image:  ("https://devcdn.sary.co/HOT_bvKVHDe.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("????????????"), image:  ("https://devcdn.sary.co/FAV_nKbqN1v.png"), emptyContentMessage:  ("???? ???????? ???????????? ???? ??????????????"), hasData:  (false), showUnavailableItems:  (false), showInBrochureLink:  (false))], dataType:  ("smart"), showTitle:  (false), uiType:  ("grid"), rowCount:  (4)),  Basket(id:  (9), title:  ("??????????????"), data: [BasketItem(group_id: nil, name:  ("????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D9%85%D9%80%D9%80%D8%B9%D9%80%D9%80%D9%80%D9%84%D8%A8%D8%A7%D8%AA.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("??????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%B2%D9%8A%D9%80%D9%80%D9%80%D9%80%D9%80%D8%AA.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%AD%D9%84%D9%88%D9%8A%D8%A7%D8%AA.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%AE%D9%81%D8%A7%D9%8A%D9%81.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D9%85%D9%80%D9%80%D9%80%D9%88%D9%8A%D9%80%D9%80%D9%80%D9%80%D9%87.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("?????????????? ??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D9%85%D8%B4%D8%B1%D9%88%D8%A8%D8%A7%D8%AA_%D8%BA%D8%A7%D8%B2%D9%8A%D8%A9.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("???????? ??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%B7%D8%A7%D9%82%D8%A9_%D9%88%D8%B4%D8%B9%D9%8A%D8%B1.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%B9%D8%B5%D9%8A%D8%B1%D8%A7%D8%AA.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("??????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D9%82%D8%B1%D8%B7%D8%A7%D8%B3%D9%8A%D8%A9.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("?????? ??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%B4%D8%A7%D9%8A_%D9%88_%D9%82%D9%87%D9%88%D8%A9.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("???? ??????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%B1%D8%B2_%D9%88%D9%85%D9%83%D8%B1%D9%88%D9%86%D8%A9.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%AD%D9%80%D9%80%D9%80%D9%80%D9%84%D9%8A%D9%80%D9%80%D9%80%D9%80%D8%A8.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("???????????????? ????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%B7%D9%80%D9%80%D9%80%D9%80%D9%80%D8%A7%D8%B2%D8%AC.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("?????????????? ??????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/08/31/%D8%A7%D9%84%D8%B9%D9%86%D8%A7%D9%8A%D8%A9_%D8%A7%D9%84%D8%B4%D8%AE%D8%B5%D9%8A%D8%A9.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false))], dataType:  ("group"), showTitle:  (true), uiType:  ("grid"), rowCount:  (4)),  Basket(id:  (25), title:  (""), data: [BasketItem(group_id: nil, name: nil, image:  ("https://devcdn.sary.co/Back_to_school_Group_Offer_Banners-AR_KAlq9Ll.png"), emptyContentMessage: nil, hasData: nil, showUnavailableItems: nil, showInBrochureLink: nil), BasketItem(group_id: nil, name: nil, image:  ("https://devcdn.sary.co/Smashing_Offers_Group_Offer_Banners-01.png"), emptyContentMessage: nil, hasData: nil, showUnavailableItems: nil, showInBrochureLink: nil), BasketItem(group_id: nil, name: nil, image:  ("https://devcdn.sary.co/Smashing_Offers_Group_Offer_Banners-01.png"), emptyContentMessage: nil, hasData: nil, showUnavailableItems: nil, showInBrochureLink: nil), BasketItem(group_id: nil, name: nil, image:  ("https://devcdn.sary.co/Smashing_Offers_Group_Offer_Banners-01.png"), emptyContentMessage: nil, hasData: nil, showUnavailableItems: nil, showInBrochureLink: nil), BasketItem(group_id: nil, name: nil, image:  ("https://devcdn.sary.co/Smashing_Offers_Group_Offer_Banners-01.png"), emptyContentMessage: nil, hasData: nil, showUnavailableItems: nil, showInBrochureLink: nil)], dataType:  ("banner"), showTitle:  (false), uiType:  ("grid"), rowCount:  (5)), Basket(id:  (13), title:  ("?????? ????????????"), data: [BasketItem(group_id: nil, name:  ("??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/02/16/%D9%85%D9%82%D8%A7%D9%87%D9%8A.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/02/16/%D9%85%D9%83%D8%A7%D8%AA%D8%A8.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/02/16/%D9%85%D8%B7%D8%A7%D8%B9%D9%85.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("??????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/02/16/%D9%81%D9%86%D8%A7%D8%AF%D9%82.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false)), BasketItem(group_id: nil, name:  ("????????????"), image:  ("https://devcdn.sary.co/layout_groups/2020/04/28/%D9%A3_copy_2.png"), emptyContentMessage: nil, hasData:  (true), showUnavailableItems:  (false), showInBrochureLink:  (false))], dataType:  ("group"), showTitle:  (true), uiType:  ("grid"), rowCount:  (3))]
        
        completion(banners, baskets, nil)
    }
}

