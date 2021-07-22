//
//  CategoryCollectionViewCell.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 15/07/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var labelCategory: UILabel!
    
    func setupDataCategory(data: DataItems) {
        imageCategory.image = UIImage(named: data.imageFav)
        labelCategory.text = data.nama
    }
    
    func setupView(){
        imageCategory.roundCorners(.allCorners, radius: 20)
        viewCategory.roundCorners(.allCorners, radius: 20)
    }
    
}
