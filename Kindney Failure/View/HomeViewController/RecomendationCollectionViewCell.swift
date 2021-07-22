//
//  RecomendationCollectionViewCell.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 15/07/21.
//

import UIKit

class RecomendationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageRecomendation: UIImageView!
    @IBOutlet weak var viewRecomendation: UIView!
    @IBOutlet weak var labelNameRecomendation: UILabel!
    
    func setupData(data: DataItems){
        imageRecomendation.image = UIImage(named: data.imageFav)
        labelNameRecomendation.text = data.nama
    }
    
    
    func setView() {
        imageRecomendation.layer.cornerRadius = 10
        viewRecomendation.addGradiant()
    }
    
}
