//
//  SaryHomeViewModel.swift
//  flagship-iOS
//
//  Created by Mina on 13/02/2022.
//

import Foundation
import RxSwift
import RxCocoa

final class SaryHomeViewModel: SaryHomeViewModelProtocol {
    
    
    // MARK:- Attributes
    private let service: APIServiceProtocol
    private let disposeBag = DisposeBag()

    let dataSource = BehaviorRelay<SaryHomeUIModel>(value: .loading)
    

    // MARK: viewModel init
    init(service: APIServiceProtocol) {
        self.service = service
    }
    
    func attach() {
        fetchBanners()
    }
    
    private func fetchBanners() {
        service.homeService(completion: { [weak self] banners, baskets, error in
            if let error = error {
                // TODO:- show error view
                self?.dataSource.accept(.error(error: error))
            }
            if let banners = banners {
                self?.dataSource.accept(.banner(banners: banners))
            }
            if let baskets = baskets {
                baskets.forEach {
                    let type = SaryHomeSectionType(rawValue: $0.dataType!)!
                    self?.dataSource.accept(.section(route: type, basket: $0))
                    print("\(type.rawValue) - \($0.data.count)")
                }
            }
        })
    }
    

    
}
