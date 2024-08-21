//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UIView!

    @IBOutlet weak var splitPeople: UILabel!
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitPeople.text = String(Int(sender.value))
        splitNumber = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = Double(billTextField.text!) ?? 0.0
        splitNumber = Int(splitPeople.text!) ?? 0
        self.total = (total * ( 1 + tipPct))/Double(splitNumber)
        print(total)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let destination = segue.destination as! ResultsViewController
            destination.split = splitNumber
            destination.total = total
            destination.tip = Int(tipPct*100)
        }
    }
    
    var total = 0.0
    var splitNumber = 0
    var tipPct = 0.1
    @IBAction func tipChanged(_ sender: UIButton) {
        if zeroPctButton == sender {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPct = 0.0
        } else if tenPctButton == sender {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipPct = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipPct = 0.2
        }
    }

    override func viewDidLoad() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CalculatorViewController.dismissKeyboard))
         tap.cancelsTouchesInView = false
         view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

