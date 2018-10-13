//
//  ViewController.swift
//  Calculator
//
//  Created by Esraa Shata on 8/18/18.
//  Copyright © 2018 Esraa Shata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var ShowLa: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var newOperation = true
    var OP = "+"
    var FirstNum:Double?
    
    func ShowNumber(number:String){
        var textNumber = String(ShowLa.text!)
        if newOperation{
            textNumber = ""
            newOperation = false
        }
        textNumber = textNumber + number
        ShowLa.text = textNumber
    }
//Numbers buttons
    @IBAction func bu0(_ sender: Any) {
    ShowNumber(number: "0")
    }
    @IBAction func bu(_ sender: Any) {
         ShowNumber(number: ".")
    }
    @IBAction func bu1(_ sender: Any) {
         ShowNumber(number: "1")
    }
    @IBAction func bu2(_ sender: Any) {
         ShowNumber(number: "2")
    }
    @IBAction func bu3(_ sender: Any) {
         ShowNumber(number: "3")
    }
    @IBAction func bu4(_ sender: Any) {
         ShowNumber(number: "4")
    }
    @IBAction func bu5(_ sender: Any) {
         ShowNumber(number: "5")
    }
    @IBAction func bu6(_ sender: Any) {
         ShowNumber(number: "6")
    }
    @IBAction func bu7(_ sender: Any) {
         ShowNumber(number: "7")
    }
    @IBAction func bu8(_ sender: Any) {
         ShowNumber(number: "8")
    }
    @IBAction func bu9(_ sender: Any) {
         ShowNumber(number: "9")
    }
    @IBAction func buAC(_ sender: Any) {
        //self.title = "C"
            ShowLa.text = "0"
            newOperation = true
    }
    
    @IBAction func buNegative(_ sender: Any) {
        var textNumber = String(ShowLa.text!)
        textNumber = "-" + textNumber
        ShowLa.text = textNumber
          newOperation = true
    }
    
    @IBAction func buPercentage(_ sender: Any) {
        let num = Double(ShowLa.text!)! / 100
         ShowLa.text = String(num)
          newOperation = true
    }
    
    
   /////////Operations//////////////
    @IBAction func buDivision(_ sender: Any) {
        OP = "/"
        FirstNum = Double(ShowLa.text!)
       newOperation = true
    }
    
 @IBAction func buMul(_ sender: Any) {
    OP = "*"
    FirstNum = Double(ShowLa.text!)
    newOperation = true
    }
    
    @IBAction func buSub(_ sender: Any) {
        OP = "-"
        FirstNum = Double(ShowLa.text!)
        newOperation = true
    }
    
    @IBAction func buAdd(_ sender: Any) {
        OP = "+"
        FirstNum = Double(ShowLa.text!)
        newOperation = true
    }
    
    @IBAction func buEqual(_ sender: Any) {
        let seconedNumber = Double(ShowLa.text!)
        var result:Double?
        switch OP {
        case "/":
            result = FirstNum!/seconedNumber!
        case "*":
            result = FirstNum!*seconedNumber!
        case "-":
            result = FirstNum!-seconedNumber!
        case "+":
            result = FirstNum!+seconedNumber!
        default:
            result = seconedNumber!
        }
        ShowLa.text = String(result!)
        newOperation = true
    }
}


