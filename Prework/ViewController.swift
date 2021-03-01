//
//  ViewController.swift
//  Prework
//
//  Created by Leonardo Valdivia on 2/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tipRate = 0.00

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }
    
    
    @IBAction func billAmountChanged(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func tipControlPressed(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.20]
        tipRate = tipPercentages[tipControl.selectedSegmentIndex]
        
        // Set slider value to selected percentage
        tipSlider.value = Float(tipRate)
        
        calculateTip()
    }
    
    @IBAction func tipSliderChanged(_ sender: Any) {
        // Set tipRate to rounded tipSlider value
        let tempTip = Double(tipSlider.value)
        tipRate = Double(round(100 * tempTip) / 100)

        tipControl.selectedSegmentIndex = -1
        calculateTip()
        
    }
    
    func calculateTip() {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Format percentage fro percentageLabel
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        percentageLabel.text = formatter.string(from: NSNumber(value: tipRate))
        

        // Get total tip by multiplying tip * tipPercentage
        let tip = bill * tipRate
        let total = bill + tip

        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)

        // Update Total Amount Label
        totalLabel.text = String(format: "$%.2f", total)
    }
}

