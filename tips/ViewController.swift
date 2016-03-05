//
//  ViewController.swift
//  tips
//
//  Created by Iria on 3/2/16.
//  Copyright © 2016 Iria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto focus on bill field and show keyboard
        billField.becomeFirstResponder()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipIndex")
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = Float(tipPercentages[tipControl.selectedSegmentIndex])
        
        let billAmount = Float(billField.text!)
        let tip = billAmount! * tipPercentage
        let total = billAmount! + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}