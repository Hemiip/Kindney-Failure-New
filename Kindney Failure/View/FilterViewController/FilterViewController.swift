//
//  FIlterViewController.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 16/07/21.
//

import UIKit

class FilterViewController: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
//        view.addGestureRecognizer(panGesture)

                
//        terapkanActionButton.layer.cornerRadius = 12
    }
    
//    override func viewDidLayoutSubviews() {
//        if !hasSetPointOrigin {
//            hasSetPointOrigin = true
//            pointOrigin = self.view.frame.origin
//        }
//    }
    
    
//    @IBAction func nutritionActionButton(_ sender: UIButton) {
//        let tags = sender.currentTitle
//        let nmr = sender.tag
//        print("Ini tags : \(String(tags!))", nmr)
//
//        nutritionTypeButton.forEach({
//            $0.setTitleColor(.lightGray, for: .normal)
//            $0.backgroundColor = .clear
//        })
//
//        sender.setTitleColor(.white, for: .normal)
//        sender.layer.cornerRadius = 15
//        sender.backgroundColor = .init(cgColor: CGColor(red: 120/255, green: 149/255, blue: 102/255, alpha: 1))
//
//
//
//
//    }
    
//    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
//        let translation = sender.translation(in: view)
//
//        // Not allowing the user to drag the view upward
//        guard translation.y >= 0 else { return }
//
//        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
//        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
//
//        if sender.state == .ended {
//            let dragVelocity = sender.velocity(in: view)
//            if dragVelocity.y >= 1300 {
//                self.dismiss(animated: true, completion: nil)
//            } else {
//                // Set back to original position of the view controller
//                UIView.animate(withDuration: 0.3) {
//                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
//                }
//            }
//        }
//    }
}
