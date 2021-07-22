//
//  TestViewController.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 17/07/21.
//

import UIKit

class TestViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        shapeLayer.customProgressBar(strokeEnd: 0.03, arcCenter: view.center)
//        view.layer.addSublayer(shapeLayer)
        progressBarCircle()
//        proggresRing.currentValue =÷
        
//        progressBarRing()
        // Do any additional setup after loading the view.
    }
    
    
    func progressBarCircle() {
        
//
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    
    @objc private func handleTap() {
        print("Testt Tapp")
        
        let basicAnim = CABasicAnimation(keyPath: "strokeEnd")
        basicAnim.toValue = 1
        basicAnim.duration = 2
        
        basicAnim.fillMode = CAMediaTimingFillMode.forwards
        basicAnim.isRemovedOnCompletion = false
        
//        shapeLayer.add(basicAnim, forKey: "urSoBasic")
    }

}
