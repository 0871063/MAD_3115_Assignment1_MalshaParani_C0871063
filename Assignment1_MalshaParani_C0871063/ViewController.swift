//
//  ViewController.swift
//  Assignment1_MalshaParani_C0871063
//
//  Created by Malsha Lambton on 2022-10-15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var USDTextField: UITextField!
    
    @IBOutlet weak var CADTextField: UITextField!
    
    @IBOutlet weak var clearBTN: UIButton!
    @IBOutlet weak var converterBTN: UIButton!
    let usdRate : Double = 0.72
    let cadRate : Double = 1.39
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func currencyConverter(_ sender: Any) {
        let usdValue = Double(USDTextField.text ?? "0.0") ?? 0.0
        let cadValue = Double(CADTextField.text ?? "0.0") ?? 0.0
        
        if cadValue == 0.0 && usdValue == 0.0  {
            showAlert(title: "Error", actionTitle: "OK", message: "Please enter at-least one value to do the calculation.", preferredStyle: .alert)
        }else if cadValue != 0.0 && usdValue != 0.0  {
            showAlert(title: "Error", actionTitle: "OK", message: "Please enter one value to do the calculation.", preferredStyle: .alert)
        }else{
            let resultValue = converter(usdValue: usdValue, cadValue: cadValue)
            
            if cadValue == 0.0 {
                CADTextField.text = String(resultValue)
            }else  if usdValue == 0.0 {
                USDTextField.text = String(resultValue)
            }
            clearBTN.isEnabled = true
        }
    }
    
    private func converter(usdValue : Double , cadValue : Double) -> Double{
        var result : Double = 0.0
        if cadValue != 0.0 {
            result = cadValue * usdRate
        }else  if usdValue != 0.0 {
            result = usdValue * cadRate
        }
        return result
    }
    
    private func showAlert(title : String, actionTitle : String, message : String, preferredStyle : UIAlertController.Style){
        
        let alert = UIAlertController(title:title , message:message , preferredStyle: preferredStyle)
        let action = UIAlertAction(title: actionTitle, style: .cancel)
        alert.addAction(action)
        present(alert, animated: true){
            self.USDTextField.text = ""
            self.CADTextField.text = ""
        }
    }
    
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func clearFields() {
        self.USDTextField.text = ""
        self.CADTextField.text = ""
        clearBTN.isEnabled = false
    }
}

