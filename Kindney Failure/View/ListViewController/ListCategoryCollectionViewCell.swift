//
//  ListCategoryCollectionViewCell.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 16/07/21.
//

import UIKit

class ListCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewListCategory: UIView!
    @IBOutlet weak var isFavoriteListCategory: UIButton!
    @IBOutlet weak var imageListCategory: UIImageView!
    @IBOutlet weak var nameListCategory: UILabel!
    @IBOutlet weak var kaliumListCategory: UILabel!
    @IBOutlet weak var sodiumListCategory: UILabel!
    @IBOutlet weak var fosforListCategory: UILabel!
    
    func setViewItem() {
        imageListCategory.layer.masksToBounds = true
        imageListCategory.roundCorners(.allCorners, radius: 10)
        viewListCategory.roundCorners(.allCorners, radius: 20)
    }
    
//    func setDataItem(data: DataItems) {
//        imageListCategory.image = UIImage(named: data.imageFav)
//        nameListCategory.text = data.nama
//        kaliumListCategory.text =
//        sodiumListCategory.text =
//        fosforListCategory.text =
//        isFavoriteListCategory
//    }
    
}
