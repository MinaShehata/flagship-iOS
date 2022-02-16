//
//  SaryHomeViewController.swift
//  flagship-iOS
//
//  Created by Mina on 13/02/2022.
//

import UIKit
import RxSwift

class SaryHomeViewController: UIViewController, SaryHomeViewControllerProtocol {
    
    //MARK:- Attributes
    let viewModel: SaryHomeViewModelProtocol
    private let disposeBag = DisposeBag()
    lazy var sarySectionCoordinator = SarySectionCoordinator(containerVC: self)
    // MARK:- Outlets
    @IBOutlet private weak var scrollView: ResizableScrollView!
    @IBOutlet private weak var stackView: UIStackView!

    //MARK:- Lifecycle
    init(viewModel: SaryHomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.attach()
    }
    private func setupUI() {
        bindDataSource()
    }
    
    func bindDataSource() {
        viewModel.dataSource
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] homeUIModel in
                guard let weakSelf = self else { return }
                switch homeUIModel {
                case let .banner(banners):
                    weakSelf.HideSpinner()
                    weakSelf.sarySectionCoordinator.showBannerViewController(banners: banners, parent: weakSelf.stackView)
                case let .section(route, basket):
                    weakSelf.HideSpinner()
                    weakSelf.sarySectionCoordinator.showSectionViewController(route: route, basket: basket, parent: weakSelf.stackView)
                case .loading:
                    self?.ShowSpinner()
                case let .error(error):break
                    //TODO:- show error
                }
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
    
}
extension SaryHomeViewController {
    
    func ShowSpinner() {
        StartLoading()
    }
    
    func HideSpinner() {
        StopLoading()
    }
    
}
