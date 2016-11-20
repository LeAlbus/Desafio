//
//  ViewController.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/19/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import UIKit
import CoreLocation
//import GooglePlaces
//import GooglePlacePicker

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var currentUserLocation: CLLocation?
    
    let GooglePlacesManager = GooglePlacesAPIController()
    let jsonParser = JSONParser()
    
    //var placesClient: GMSPlacesClient?
    //var placePicker: GMSPlacePicker?


    override func viewDidLoad() {
        super.viewDidLoad()

       // placesClient = GMSPlacesClient.shared()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
    }
    
    func runSearch(){
        
        //setting user location
        currentUserLocation = locationManager.location!
        
        let latitude = currentUserLocation?.coordinate.latitude
        let longitude = currentUserLocation?.coordinate.longitude
        
        //Request nearby garages
        let rawJson = self.GooglePlacesManager.requestForLocation(latitude: latitude!, longitude: longitude!)
        print(self.jsonParser.readPlaces(json: rawJson))
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        //This function is called whenever the app's access to location services is changes
        //It is always called when the app starts
        
        switch CLLocationManager.authorizationStatus() {
            
        case CLAuthorizationStatus.authorizedWhenInUse, CLAuthorizationStatus.authorizedAlways:
            
            print("User has allowed the app's access to location services")
            
            self.runSearch()

        case CLAuthorizationStatus.denied:
            
            print("User has denied the app's access to location services")
            
            let alert = UIAlertController(title: "Location disabled", message: "This app is not able to find your current location, please go to Settings and turn on Location Service for this app.", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        case CLAuthorizationStatus.restricted:
            //This case means the device is not allowed to access its own location. 
            //It can happen when parental controlling is denying such information, for example
            
            print("Device's access to location services is restricted")
            
            let alert = UIAlertController(title: "Location disabled", message: "This app is not allowed to find your current location, the device restricts the access to location services.", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)

            
        default:
            print("User has not yet authorized/denied the app's access to location services")
            
            self.locationManager.requestWhenInUseAuthorization()

        }
     }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

