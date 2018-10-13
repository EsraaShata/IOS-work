//
//  ViewController.swift
//  Peckemon
//
//  Created by Esraa Shata on 9/10/18.
//  Copyright © 2018 Esraa Shata. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController,CLLocationManagerDelegate {

    var mapView : GMSMapView!
    let locationManager = CLLocationManager()
    var listPockemon = [Pockemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPeckemons()
        //the view of camera
        let camera = GMSCameraPosition.camera(withLatitude: 43, longitude: -77, zoom: 10)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        
       ///get user location
        
        self.locationManager.requestAlwaysAuthorization() //permition to get user location
        self.locationManager.requestWhenInUseAuthorization()  //get permition also in run time
        //if the user accept to use his location
        if CLLocationManager.locationServicesEnabled(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters  //update location every 10 meters
        locationManager.startUpdatingLocation()
        }
    }
    
    var myLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        myLocation = manager.location!.coordinate
        self.mapView.clear()
        
        //My Character on the map
        let markerMe = GMSMarker()
        markerMe.position = CLLocationCoordinate2D(latitude: myLocation.latitude, longitude: myLocation.longitude)
        markerMe.title = "Me"
        markerMe.snippet = "Here is my location"
        markerMe.icon = UIImage(named: "mario")
        markerMe.map = self.mapView
        
        //show pockemons on the map
        var index = 0
        for pockemon in listPockemon{
            if pockemon.isCatsh == false{
            let markerPockemon = GMSMarker()
            markerPockemon.position = CLLocationCoordinate2D(latitude: pockemon.latitude!, longitude: pockemon.longitude!)
            markerPockemon.title = pockemon.name!
            markerPockemon.snippet = "\(pockemon.des!) with power \(pockemon.power!)"
            markerPockemon.icon = UIImage(named:pockemon.image!)
            markerPockemon.map = self.mapView
            
            //catch pockemon
            if (Double(myLocation.latitude).roundTo(places: 4)) == Double(pockemon.latitude!).roundTo(places: 4) && Double(myLocation.longitude).roundTo(places: 4) == Double(pockemon.longitude!).roundTo(places: 4) {
                listPockemon[index].isCatsh = true
                alertDialod(pockemonPower: pockemon.power!)
            }
            }
            index += 1
            
        }
        
       
        let camera = GMSCameraPosition.camera(withLatitude: myLocation.latitude, longitude: myLocation.longitude, zoom: 15)
        self.mapView.camera = camera
        
    }
    var playerPower = 0.0
    func loadPeckemons(){
       self.listPockemon.append(Pockemon(latitude: 31.427897, longitude: 31.812115, name: "Charmander", image: "charmander", des: "Charmander comes from Jappan", power: 50.89))
         self.listPockemon.append(Pockemon(latitude: 31.425592, longitude: 31.804765, name: "Squirtle", image: "squirtle", des: "Squirtle comes from Canada", power: 80.67))
        self.listPockemon.append(Pockemon(latitude: 31.421244, longitude: 31.808788, name: "Bulbasaur", image: "bulbasaur", des: "Bulbasaur comes from North Africa", power: 65.98))
    }
    
    func alertDialod(pockemonPower:Double){
        playerPower += pockemonPower
        let alert = UIAlertController(title: "Caught new pockemon🌟", message: "Congrats your new power is\(playerPower)⚡️", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {action in print("+ one")} ))
        self.present(alert,animated:true,completion:nil)
        
    }


}
extension Double{
    func roundTo(places:Int) -> Double {
        let devisor = pow(10.0, Double(places))
        return (self*devisor).rounded()/devisor
    }
}


























