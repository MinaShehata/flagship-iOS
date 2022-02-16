//
//  Contract.swift
//  flagship-iOS
//
//  Created by Mina on 13/02/2022.
//

import RxSwift
import RxCocoa

enum SaryHomeSectionType: String {
    case featuredBanner
    case smart
    case group
    case banner
}

protocol APIServiceProtocol: AnyObject {
    func homeService(completion: @escaping ([Banner]?, [Basket]?, FlagShipError?) -> ())
}

protocol SaryHomeViewControllerProtocol: AnyObject, SpinnerView {
    var viewModel: SaryHomeViewModelProtocol { get }
}

protocol SaryHomeViewModelProtocol: AnyObject {
    var dataSource: BehaviorRelay<SaryHomeUIModel> { get }
    func attach()
}

protocol SarySectionViewContollerProtocol: AnyObject {
    var viewModel: SarySectionViewModelProtocol {get}
}

protocol SarySectionViewModelProtocol: AnyObject {
    var bannerUIModel: PublishRelay<[Banner]> { get}
    var basketUIModel: PublishRelay<[BasketItem]> { get}
    var getTitle: String { get }
    func attach()
    
}
