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
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var asciiButton: UIButton!
    
    
    //customising the placeholder font
    let placeHolder = NSAttributedString(string: "Your Value is...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedStringKey.font: UIFont(name: "menlo", size: 40.0)!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //custom place holder font and color
        valueTextField.attributedPlaceholder = placeHolder
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
        asciiButton.isEnabled = true
        textButton.isEnabled = true
        
        decimalButton.alpha = 1.0
        binaryButton.alpha = 1.0
        asciiButton.alpha = 1.0
        textButton.alpha = 1.0
    }
    
    func disableButton(){
        
        decimalButton.isEnabled = false
        binaryButton.isEnabled = false
        asciiButton.isEnabled = false
        textButton.isEnabled = false
        
        decimalButton.alpha = 0.6
        binaryButton.alpha = 0.6
        asciiButton.alpha = 0.6
        textButton.alpha = 0.6
        
    }
    
    func splitSpaceNumber() -> [String] {
        guard let seperationString = valueTextField.text?.components(separatedBy: " ") else {return [""]}
        print(seperationString)
        return seperationString
    }

    @IBAction func decimalButtonPressed(_ sender: Any) {
        
        if !(valueTextField.text?.contains(" "))!{
            
            if valueTextField.text != "" {
                
                decimalButton.alpha = 1.0
               // binaryButton.alpha = 0.6
                
                guard let string = valueTextField.text else {return}
                
                let bitsFromString = string.map{ Int(String($0))!}
                let binaryDigit = BinaryDecimal(bitsFromString)
                valueTextField.text = " \(binaryDigit.calculateIntValueForBinary())"
            }
            
        } else {
            
            var newStr: [String] = []
            newStr =  splitSpaceNumber()
            valueTextField.text = " "
            for str in newStr {
                
                let bitsFromString = str.map{ Int(String($0))!}
                let binaryDigit = BinaryDecimal(bitsFromString)
                valueTextField.text = valueTextField.text! + " \(binaryDigit.calculateIntValueForBinary())"
                
            }
        }
        
        disableButton()
       
    }
    
    
    @IBAction func binaryButtonPressed(_ sender: Any) {
        
        if !(valueTextField.text?.contains(" "))! {
            
            if valueTextField.text != "" {
                binaryButton.alpha = 1.0
               // decimalButton.alpha = 0.6
                
                guard let string = valueTextField.text, let intFromString = Int(string) else {return}
                
                let binaryDigit = BinaryDecimal(intFromString)
                
                valueTextField.text = "\(binaryDigit.calculateBinaryValueForInt())"
            }
            
        } else {
            
            var newStr: [String] = []
            newStr =  splitSpaceNumber()
            valueTextField.text = ""
            for str in newStr {
                
                guard let intFromString = Int(str) else {return}
                let binaryDigit = BinaryDecimal(intFromString)
                valueTextField.text = valueTextField.text! + " \(binaryDigit.calculateBinaryValueForInt())"
                
            }
            
        }
        
        disableButton()
        
    }
    
    //convert from text to ascii code
    @IBAction func asciiButtonPressed(_ sender: Any) {
        

         //text to ascii
        if valueTextField.text != "" {

            guard let string = valueTextField.text else {return}
            valueTextField.text = ""
            for s in string.unicodeScalars {

                valueTextField.text = valueTextField.text! + "\(s.value) "

            }
        }
        
        disableButton()
    }
    
    //convert unicode ascii to text
    @IBAction func toTextButtonPressed(_ sender: Any) {
        
        if !(valueTextField.text?.contains(" "))! {
            
            if valueTextField.text != "" {
                
                guard let string = Int(valueTextField.text!) else {return}
                //let c = String(describing: UnicodeScalar(string)!)
                valueTextField.text = ""
                let u = UnicodeScalar(string)
                let c = Character(u!)
                
                valueTextField.text = valueTextField.text! + "\(c)"
                //print(c)
            }
            
        } else {
            
            var newStr: [String] = []
            newStr =  splitSpaceNumber()
            valueTextField.text = ""
            for str in newStr {
                
                let string = Int (str)
                let u = UnicodeScalar(string!)
                let c = Character(u!)
                print(c)
                valueTextField.text =  valueTextField.text! + "\(c) "
                
            }
        }
        
        disableButton()
    }

}

