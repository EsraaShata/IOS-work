//
//  ViewController.swift
//  Find Age
//
//  Created by Esraa Shata on 8/11/18.
//  Copyright © 2018 Esraa Shata. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var txtDayOfBirth: UITextField!
    @IBOutlet weak var txtMonthOfBirth: UITextField!
    @IBOutlet weak var txtYearOfBirth: UITextField!
    @IBOutlet weak var laTheAge: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    @IBAction func ShowAge(_ sender: UIButton) {
     getAge()
    }
    func getAge(){
        //year
        let year = Calendar.current.component(.year, from: Date())
        let birthYear = Int(txtYearOfBirth.text!)
        var yourYear = year - birthYear!
        //month
        let month = Calendar.current.component(.month, from: Date())
        let birthMonth = Int(txtMonthOfBirth.text!)
        var yourMonth = month - birthMonth!
        
        
        //day
        let day = Calendar.current.component(.day, from: Date())
        let birthDay = Int(txtDayOfBirth.text!)
        var yourDay = day - birthDay!
        
        if yourDay<0 && yourMonth == 0{
            yourMonth = yourMonth - 1
            yourDay = yourDay + 30}
       
            if yourMonth<0 {
            yourYear = yourYear - 1
            yourMonth = yourMonth + 12
            
           if yourDay<0{
                yourMonth = yourMonth - 1
                yourDay = yourDay + 30
            }
            
        }
      
        
        if yourDay == 0 && yourMonth == 0 {
            laTheAge.text = "Ohh! Happy \(yourYear)'s Birthday 🎂🎊"
        }
        else{ laTheAge.text = "Your're \(yourYear) Years , \(yourMonth) Months and \(yourDay) days"}
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getAge()
             self.view.endEditing(true)
        return true
    }
}


