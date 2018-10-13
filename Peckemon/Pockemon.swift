//
//  Pockemons.swift
//  Peckemon
//
//  Created by Esraa Shata on 9/14/18.
//  Copyright © 2018 Esraa Shata. All rights reserved.
//

import UIKit

class Pockemon: NSObject {
    
    var latitude : Double?
    var longitude : Double?
    var name : String?
    var image : String?
    var des : String?
    var power : Double?
    var isCatsh : Bool?
    init(latitude:Double,longitude:Double,name:String,image:String, des:String,power:Double) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.image = image
        self.des = des
        self.power = power
        self.isCatsh = false
    }

}
