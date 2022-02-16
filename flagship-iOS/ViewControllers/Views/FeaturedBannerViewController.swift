//
//  FeaturedBannerViewController.swift
//  flagship-iOS
//
//  Created by Mina on 15/02/2022.
//

import UIKit
import RxSwift

final class FeaturedBannerViewController: UIViewController, SarySectionViewContollerProtocol {
    
    //MARK:- outlets
    @IBOutlet private weak var carouselView: ZKCarousel!
    
    //MARK:- attributes
    let viewModel: SarySectionViewModelProtocol
    private let disposeBag = DisposeBag()
    
    
    
    //MARK:- lifecycle
    init(viewModel: SarySectionViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindBannersDataSource()
        viewModel.attach()
    }
    
    private func bindBannersDataSource() {
        viewModel.bannerUIModel
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] banners in
                self?.carouselView.slides = banners.map { ZKCarouselSlide(image: $0.photo) }
            })
            .subscribe()
            .disposed(by: disposeBag)
    }

}
