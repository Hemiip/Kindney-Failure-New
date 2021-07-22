//
//  FillDataViewController.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 19/07/21.
//

import UIKit

class FillDataViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var entryNameField: UITextField!
    @IBOutlet weak var tinggiBadanField: UITextField!
    @IBOutlet weak var beratBadanField: UITextField!
    @IBOutlet weak var urineField: UITextField!
    @IBOutlet weak var selanjutnyaActionButton: UIButton!
    
    var activField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
//        if (UserDefaults.standard.bool(forKey: "statusLogin") == true){
//            performSegue(withIdentifier: "homePageIsLogin", sender: self)
//        }
        
        tapGesture.addTarget(self, action: #selector(tapGestureAction))
        
        selanjutnyaActionButton.addTarget(self, action: #selector(selanjutnyaAction), for: .touchUpInside)
        
        selanjutnyaActionButton.layer.cornerRadius = 12
        tinggiBadanField.layer.cornerRadius = 8
        beratBadanField.layer.cornerRadius = 8
        entryNameField.layer.cornerRadius = 8
        urineField.layer.cornerRadius = 8
        
        self.activField = UITextField()
    }
    
    @objc func selanjutnyaAction() {
        
        if tinggiBadanField.isEmpty || beratBadanField.isEmpty || entryNameField.isEmpty || urineField.isEmpty {
            print("Kosongg")
            alertButton(title: "Perhatian!", message: "Beberapa field masih ada yang kosong", completion: {
                alertControll in
                
                let okeAction = UIAlertAction(title: "Oke", style: UIAlertAction.Style.cancel)
                
                alertControll.addAction(okeAction)
                
                self.present(alertControll, animated: true, completion: nil)
            })
        } else {
            print("Nextt Page")
            performSegue(withIdentifier: "jadwalCuciDarah", sender: self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.tinggiBadanField.delegate = self
        self.beratBadanField.delegate = self
        self.entryNameField.delegate = self
        self.urineField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func tapGestureAction() {
        self.view.endEditing(true)
    }
    
}


extension FillDataViewController: UITextFieldDelegate {
    //ACtivate return on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.activField = nil
        return true
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardInfo = notification.userInfo else { return }
        
        if let keyboardSize = (keyboardInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
            let keyboardHeight = keyboardSize.height + 10
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            self.scrollView.contentInset = contentInsets
            var viewRect = self.view.frame
            viewRect.size.height -= keyboardHeight
            
            guard let activeField = self.activField else {return }
            if (!viewRect.contains(activeField.frame.origin)) {
                let scrollPoint = CGPoint(x: 0, y: activField.frame.origin.y - keyboardHeight)
                self.scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
    }
}
