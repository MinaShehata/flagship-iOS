//
//  GroupBasketViewController.swift
//  flagship-iOS
//
//  Created by Mina on 16/02/2022.
//

import UIKit
import RxSwift

final class GroupBasketViewController: UIViewController, SarySectionViewContollerProtocol {
    
    //MARK:- outlets
    @IBOutlet private weak var collectionView: ResizableCollectionView!
    @IBOutlet private weak var nameLabel: UILabel!

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
        nameLabel.text = viewModel.getTitle
        collectionView.register(UINib(nibName: "\(BasketCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(BasketCell.self)")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 64, height: 105)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 25, bottom: 0, right: 25)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func bindBannerDataSource() {
        viewModel.basketUIModel
            .bind(to: collectionView.rx.items) { collectionView, index, item in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BasketCell.self)", for: indexPath) as! BasketCell
                cell.setupUI(basket: item)
                return cell
            }
            .disposed(by: disposeBag)
        
    }

}
