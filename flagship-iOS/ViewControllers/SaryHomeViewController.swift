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
    private var searchController: UISearchController!
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
        setupSearchController()
        bindDataSource()
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for what you need".Localize
        searchController.searchBar.barStyle = .default
        searchController.searchBar.keyboardAppearance = .dark
        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.tintColor = .kdarkColor
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        navigationItem.searchController = searchController
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        let saryImageView = UIImageView(image: UIImage(named: "SaryLogo"))
        let cartButton = UIButton(type: .system)
        let navMenuButton = UIButtonX(type: .system)
        navMenuButton.setImage(UIImage(named: "bottom_arraw_button"), for: .normal)
        navMenuButton.setTitle("Amana", for: .normal)
        navMenuButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        navMenuButton.backgroundColor = .kdarkColor
        navMenuButton.cornerRadius = 15
        cartButton.setImage(UIImage(named: "cart_icon"), for: .normal)

        customView.addSubview(navMenuButton)
        customView.addSubview(saryImageView)
        customView.addSubview(cartButton)

        saryImageView.frame.size.width = 85
        saryImageView.frame.size.height = 40
        cartButton.frame.size.width = 25
        cartButton.frame.size.height = 25
        navMenuButton.frame.size.width = 120
        navMenuButton.frame.size.height = 30
        navMenuButton.center = customView.center//CGPoint(x: customView.frame.midX,y: customView.frame.midY)
//        navMenuButton.frame.origin.y = - 15
        saryImageView.frame.origin = Language.currentLanguage().contains("ar") ? CGPoint(x: (customView.frame.maxX - 145), y: customView.frame.minY + 2) : CGPoint(x: 2, y: 2)
        cartButton.frame.origin = Language.currentLanguage().contains("ar") ? CGPoint(x: 2, y: 10) : CGPoint(x: customView.frame.maxX - 85, y: 10)
        navigationItem.titleView = customView
        
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
extension SaryHomeViewController: UISearchBarDelegate {
}
