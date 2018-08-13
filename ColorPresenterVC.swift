//
//  ViewController.swift
//  color magic
//
//  Created by Esraa Shata on 8/5/18.
//  Copyright © 2018 Esraa Shata. All rights reserved.
//

import UIKit

class ColorPresenterVC : UIViewController, colorTranseferDelegate {

    @IBOutlet weak var colorNameLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func userChoice(color: UIColor, colorName: String) {
        view.backgroundColor = color
        colorNameLBL.text = colorName
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentColorPickerVC"{
            guard let colorPickerVc = segue.destination as?
            ColorPicker else {return}
            colorPickerVc.delegate = self
        }
    }

}
