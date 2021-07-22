//
//  File.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 15/07/21.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
      let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
      let mask = CAShapeLayer()
      mask.path = path.cgPath
      layer.mask = mask
  }
    
    func addGradiant() {
        let GradientLayerName = "gradientLayer"

        if let oldlayer = self.layer.sublayers?.filter({$0.name == GradientLayerName}).first {
            oldlayer.removeFromSuperlayer()
        }

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.lightGray.withAlphaComponent(0.1).cgColor, UIColor.darkGray.withAlphaComponent(0.8).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        gradientLayer.name = GradientLayerName

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addShadowView() {
        self.layer.cornerRadius = 15
//        self.layer.borderWidth = 0.01
//        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.1)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
        
    }
    
    func hideWithAnimation(hidden: Bool) {
            UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.isHidden = hidden
            })
    }
    
}

extension UITextField {
    
    var isEmpty: Bool {
        if let text = self.text, !text.isEmpty {
             return false
        }
        return true
    }
}

func alertButton(title : String, message : String, completion : (UIAlertController)->()){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    completion(alertController)
}

