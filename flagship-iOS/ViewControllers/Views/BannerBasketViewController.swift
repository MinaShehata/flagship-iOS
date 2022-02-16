//
//  BannerBasketViewController.swift
//  flagship-iOS
//
//  Created by Mina on 16/02/2022.
//

import UIKit
import RxSwift

final class BannerBasketViewController: UIViewController, SarySectionViewContollerProtocol {

    //MARK:- outlets
    @IBOutlet private weak var collectionView: ResizableCollectionView!

    //MARK:- Attributes
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
        bindBannerDataSource()
        setupUI()
        viewModel.attach()
    }
    
    private func setupUI() {
        collectionView.register(UINib(nibName: "\(BannerCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(BannerCell.self)")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ((collectionView.frame.width / 2) - 50), height: 98)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 25, bottom: 0, right: 25)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func bindBannerDataSource() {
        viewModel.basketUIModel
            .bind(to: collectionView.rx.items) { collectionView, index, item in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BannerCell.self)", for: indexPath) as! BannerCell
                cell.setupUI(basket: item)
                return cell
            }
            .disposed(by: disposeBag)
        
    }
    
}
