//
//  GroupCell.swift
//  flagship-iOS
//
//  Created by Mina on 16/02/2022.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var basketItemImageView: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupUI(basket: BasketItem) {
        basketItemImageView.loadProfileImageWithUrl(url: URL(string: basket.image!)!)
    }
}
