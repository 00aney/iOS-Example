//
//  ViewController.swift
//  LocalizationExample
//
//  Created by aney on 2017. 9. 27..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //MARK: IBOutlet
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
  
  @IBOutlet weak var tipTitleLabel: UILabel!
  
  //MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.billTextField.keyboardType = .decimalPad
    
    tipTitleLabel.text = NSLocalizedString("MainScreen.tipTitleLabel", comment: "This is not the dollar amount of the tip, it is the label describing it.")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  //MARK: IBAction
  
  @IBAction func tipSegmentChanged(_ sender: Any) {
    calculateTip()
  }
  @IBAction func billChanged(_ sender: Any) {
    calculateTip()
  }
  
  
  func calculateTip() {
    if let billString = billTextField.text {
      if let billDouble = Double(billString) {
        var tipPercentage = 0.0
        switch tipSegmentedControl.selectedSegmentIndex {
        case 0:
          tipPercentage = 0.10
        case 1:
          tipPercentage = 0.15
        case 2:
          tipPercentage = 0.20
        default:
          break
        }
        
        let tip = tipPercentage * billDouble
        let total = billDouble + tip
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
      }
    }
  }
  
}
