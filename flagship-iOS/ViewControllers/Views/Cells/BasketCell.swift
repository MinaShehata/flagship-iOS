//
//  BasketCell.swift
//  flagship-iOS
//
//  Created by Mina on 15/02/2022.
//

import UIKit

class BasketCell: UICollectionViewCell {

    @IBOutlet weak var basketTitleLabel: UILabel!
    @IBOutlet weak var basketItemImageView: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupUI(basket: BasketItem) {
        basketTitleLabel.text = basket.name
        basketItemImageView.loadProfileImageWithUrl(url: URL(string: basket.image!)!)
    }
    
}
