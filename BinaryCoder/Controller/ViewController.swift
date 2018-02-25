//
//  ViewController.swift
//  BinaryCoder
//
//  Created by Rehan Parkar on 2018-02-23.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var binaryButton: UIButton!
    
    
    //customising the placeholder font
    let placeHolder = NSAttributedString(string: "Your Value is...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedStringKey.font: UIFont(name: "menlo", size: 40.0)!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //custom place holder font and color
        valueTextField.attributedPlaceholder = placeHolder
        
        //
        valueTextField.addTarget(self, action: #selector(textFieldTextChanged), for: .editingChanged)
        
        disableButton()
        
    }
    
    
    @objc func textFieldTextChanged(){
        
        if valueTextField.text == "" { // empty text field.
            
            disableButton()
            
        } else {
            
            enableButton()
        }
    }
    
    func enableButton(){
        
        decimalButton.isEnabled = true
        binaryButton.isEnabled = true
        
        decimalButton.alpha = 1.0
        binaryButton.alpha = 1.0
        
        
    }
    
    func disableButton(){
        
        decimalButton.isEnabled = false
        binaryButton.isEnabled = false
        
        decimalButton.alpha = 0.6
        binaryButton.alpha = 0.6
        
    }

    @IBAction func decimalButtonPressed(_ sender: Any) {
        
        if valueTextField.text != "" {
            
            decimalButton.alpha = 1.0
            binaryButton.alpha = 0.6
            
            guard let string = valueTextField.text else {return}
            
            let bitsFromString = string.map{ Int(String($0))!}
            let binaryDigit = BinaryDecimal(bitsFromString)
            valueTextField.text = "\(binaryDigit.calculateIntValueForBinary())"
        }
    }
    
    
    @IBAction func binaryButtonPressed(_ sender: Any) {
        
        if valueTextField.text != "" {
            binaryButton.alpha = 1.0
            decimalButton.alpha = 0.6
            
            
            guard let string = valueTextField.text, let intFromString = Int(string) else {return}
            
            let binaryDigit = BinaryDecimal(intFromString)
            
            valueTextField.text = "\(binaryDigit.calculateBinaryValueForInt())"
        }
    }

}

