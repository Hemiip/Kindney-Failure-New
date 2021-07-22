//
//  DetailPageViewController.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 17/07/21.
//

import UIKit
import MBCircularProgressBar

class DetailPageViewController: UIViewController {

    let bahan = ["sayur 300mg", "tomat 200mg", "nasi 200mg", "cabai 200mg", "tomat 200mg", "nasi 200mg", "tomat 200mg", "nasi 200mg", "tomat 200mg", "nasi 200mg"]
    let addheight = 20
    
    private var lastContentOffset: CGFloat = 0
    
    @IBOutlet weak var viewImageDetail: UIView!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var foodNameDetail: UILabel!
    @IBOutlet weak var isFavoriteFood: UIButton!
    @IBOutlet weak var viewNutritions: UIView!
    @IBOutlet weak var viewServing: UIView!
    @IBOutlet weak var countServingLabel: UILabel!
    @IBOutlet weak var sizePortionLabel: UILabel!
    @IBOutlet weak var viewIngredients: UIView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var makeFoodLabel: UILabel!
    @IBOutlet weak var eatNowActionButton: UIButton!
    @IBOutlet weak var scrollviewIngredients: UIScrollView!
    
    @IBOutlet weak var ringBarKalium: MBCircularProgressBarView!
    @IBOutlet weak var ringBarFosfor: MBCircularProgressBarView!
    @IBOutlet weak var ringBarSodium: MBCircularProgressBarView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nilai = bahan.joined(separator: "\n")
        ingredientsLabel.text = nilai
        makeFoodLabel.text = nilai
        
        ringBarFosfor.value = 0
        ringBarKalium.value = 0
        ringBarSodium.value = 0
        
        setItemView()
        
    }
    
    func setItemView() {
        self.title = "Nama Makanan"
        
        viewImageDetail.clipsToBounds = false
        viewImageDetail.layer.shadowColor = UIColor.darkGray.cgColor
        viewImageDetail.layer.shadowOpacity = 8.1
        viewImageDetail.layer.shadowOffset = .zero
        viewImageDetail.layer.shadowRadius = 4
        viewImageDetail.layer.cornerRadius = 20
        imageDetail.clipsToBounds = true
        imageDetail.roundCorners(.allCorners, radius: 20)
        
        eatNowActionButton.layer.cornerRadius = 15
        viewNutritions.layer.cornerRadius = 15
        viewServing.layer.cornerRadius = 15

        viewIngredients.layer.cornerRadius = 40
        viewIngredients.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5) {
            self.ringBarSodium.value = 70
            self.ringBarKalium.value = 90
            self.ringBarFosfor.value = 40
        }
        
    }
    
    
    @IBAction func eatNow(_ sender: Any) {
        let nilai = viewIngredients.frame.height
        print(nilai)
        
        alertButton(title: "Anda yakin mengkonsumsi ini?", message: "Kandungan di dalam makanan ini melebihi batas harian anda", completion: {
            alertControll in
            
            let tidakAction = UIAlertAction(title: "Tidak", style: UIAlertAction.Style.cancel)
            
            let yaAction = UIAlertAction(title: "Ya", style: UIAlertAction.Style.default){
                UIAlertAction in
                self.yesActionAlert()
            }
            
            alertControll.addAction(tidakAction)
            alertControll.addAction(yaAction)
            
            self.present(alertControll, animated: true, completion: nil)
            
        })
    }
    
    
    func yesActionAlert() {
        print("Setujuu")
    }
}


extension DetailPageViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if translation.y > 0 {
            print("Scroll UPPP : \(scrollView.contentOffset.y)")
            // swipes from top to bottom of screen -> down
        } else {
            // swipes from bottom to top of screen -> up
            print("Scroll UPPP : \(scrollView.contentOffset.y)")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (self.lastContentOffset > scrollView.contentOffset.y) {
                // move up
            
            print("Scroll UPPP : \(scrollView.contentOffset.y)")
            
            }
            else if (self.lastContentOffset < scrollView.contentOffset.y) {
               // move down
            }

            // update the new position acquired
            self.lastContentOffset = scrollView.contentOffset.y
    }
    
    
}
