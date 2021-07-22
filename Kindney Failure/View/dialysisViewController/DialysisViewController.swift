//
//  DialysisViewController.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 20/07/21.
//

import UIKit

class DialysisViewController: UIViewController, UITextFieldDelegate {
    
    let jadwal = ["2x / Seminggu", "3x / Seminggu"]
    let days = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"]
    var daysValue: [String] = []
    
    
    var jadwalCond:Bool = false
    var jadwalValue:String = ""
    
    @IBOutlet var tapGesturee: UITapGestureRecognizer!
    @IBOutlet weak var viewPicker: UIView!
    @IBOutlet weak var jadwaldialysis: UITextField!
    @IBOutlet weak var daysDialysis: UITextField!
    @IBOutlet weak var lewatiButton: UIButton!
    @IBOutlet weak var simpanButton: UIButton!
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var viewPicker1: UIView!
    @IBOutlet weak var viewPicker2: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewItem()
    }
    
    func setViewItem() {
        lewatiButton.layer.borderWidth = 1
        lewatiButton.layer.borderColor = UIColor.black.cgColor
        lewatiButton.layer.cornerRadius = 8
        simpanButton.layer.cornerRadius = 8
        
        viewPicker.layer.cornerRadius = 15
        
        jadwaldialysis.delegate = self
        
        let tapJadwal = UITapGestureRecognizer(target: self, action: #selector(jadwalDialysisPatient))
        jadwaldialysis.addGestureRecognizer(tapJadwal)
        jadwaldialysis.isUserInteractionEnabled = true
        let tapDay = UITapGestureRecognizer(target: self, action: #selector(daysDialysisPatient))
        daysDialysis.addGestureRecognizer(tapDay)
        daysDialysis.isUserInteractionEnabled = true
        
        tapGesturee.addTarget(self, action: #selector(tapGestureAction))
        
        picker1.delegate = self
        picker1.dataSource = self
        picker2.delegate = self
        picker2.dataSource = self
        
        picker1.tag = 1
        picker2.tag = 2
        
        viewPicker.isHidden = true
        
    }
    
    @objc func jadwalDialysisPatient() {
        viewPicker.isHidden = false
        viewPicker1.isHidden = false
        viewPicker2.isHidden = true
        picker2.reloadAllComponents()
        picker1.reloadAllComponents()
        
        daysValue.removeAll()
    }
    
    @objc func daysDialysisPatient() {
        
        if !jadwaldialysis.isEmpty {
            viewPicker.isHidden = false
            viewPicker1.isHidden = true
            viewPicker2.isHidden = false
            picker2.reloadAllComponents()
            picker1.reloadAllComponents()
            
            daysValue.removeAll()
        }
        else{
            alertAction(title: "Peringatan!", message: "Silahkan lengkapi field jadwal cuci darah")
        }
    }
    
    
    @IBAction func simpanActionButton(_ sender: UIButton) {
        
        if !jadwaldialysis.isEmpty {
            statusLogin()
        }
        else {
            alertAction(title: "Peringatan!", message: "Silahkan lengkapi field di atas terlebih dahulu")
        }
    }
    
    @IBAction func lewatiActionButton(_ sender: UIButton) {
        alertButton(title: "Anda yakin ingin lewati?", message: "Anda bisa melewati bagian ini sekarang dan mengubahnya kapan saja di halaman profil", completion: {
            alertAction in
            
            let yesAction = UIAlertAction(title: "Iya, Simpan", style: UIAlertAction.Style.default, handler: {
                UIAlert in
                self.statusLogin()
                
            })
            
            let noAction = UIAlertAction(title: "Tidak", style: UIAlertAction.Style.cancel)
            
            alertAction.addAction(yesAction)
            alertAction.addAction(noAction)
            
            self.present(alertAction, animated: true, completion: nil)
            
        })
    }
    
    @objc func tapGestureAction() {
        viewPicker.hideWithAnimation(hidden: true)
//        picker2.reloadInputViews()
        picker2.reloadAllComponents()
        picker1.reloadAllComponents()
        
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func statusLogin() {
        performSegue(withIdentifier: "homePage", sender: self)
        UserDefaults.standard.set(true, forKey: "statusLogin")
    }
    
    func alertAction(title: String, message: String) {
        alertButton(title: title, message: message, completion: {
            alertControll in
            let okeAction = UIAlertAction(title: "Oke", style: UIAlertAction.Style.cancel)
            
            alertControll.addAction(okeAction)
            
            self.present(alertControll, animated: true, completion: nil)
        })
    }
}


extension DialysisViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print("kapan jalan")
        
        if pickerView.tag == 1 {
            print("kapan jalan tag:", pickerView.tag)
            return 1
        }
        else if pickerView.tag == 2 {
            print("kapan jalan tag:", pickerView.tag)
            if self.jadwaldialysis.text == "2x / Seminggu" {
                print("kapan jalan 2 perminggu")
                return 2
            } else{
                print("kapan jalan 3333 perminggu")
                return 3
            }
        }
        else {
            print("kapan jalan GAGAL")
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("Ini COmponent: \(component)")
        
        switch pickerView.tag {
        case 1:
            print("berhasil 1")
            return jadwal.count
        case 2:
            print("berhasil 2")
            return days.count
        default:
            print("kosong")
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            return self.jadwal[row]
        case 2:
            print("berhasilll 22")
            return self.days[row]
        default:
            print("kosong")
            return "0"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.selectRow(row, inComponent: component, animated: true)
        pickerView.reloadAllComponents()
        
        switch pickerView.tag {
        case 1:
            let jadwalRow = jadwal[row]
            jadwaldialysis.text = jadwalRow
            jadwaldialysis.resignFirstResponder()

            jadwalValue = jadwalRow
            jadwalCond = true
            print(self.jadwalValue, jadwalCond)
            print("berhasil dalam 1")
            
        case 2:
            print("berhasilll 22")
            let dayArray = days[row]
            daysValue.append(dayArray)
            
            let nilai = daysValue.joined(separator: ", ")
            daysDialysis.text = nilai
            daysDialysis.resignFirstResponder()
        default:
            alertAction(title: "Peringatan!", message: "Silahkan lengkapi field di atas terlebih dahulu")
            print("kosong")
        }
    }
}
