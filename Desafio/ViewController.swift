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
 
    @IBOutlet weak var placesContainerView: UIView!
    @IBOutlet weak var holdView: UIView!
    @IBOutlet var refreshButton: UIButton!
    
    var placesListView: PlacesListDelegate!
    
    
    //var places = [[String: AnyObject]]()
    
    var locationManager: CLLocationManager!
    var currentUserLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        

    }
    
    func runSearch(){
        
        //setting user location
        currentUserLocation = self.locationManager.location!
        
        let latitude = currentUserLocation?.coordinate.latitude
        let longitude = currentUserLocation?.coordinate.longitude
        
        //Request nearby garages
        let rawJson = GooglePlacesAPIController.sharedInstance.requestForLocation(latitude: latitude!, longitude: longitude!)
        
        let places = JSONParser.sharedInstance.readPlaces(json: rawJson)
        
        if places.isEmpty{
            
        } else{
            print("RELOADING")
            DispatchQueue.main.async {
                () -> Void in
                self.placesListView.initDataSource(places: places)
            }
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Called before ViewDidLoad
        
        if let vc = segue.destination as? PlacesListDelegate, segue.identifier == "PlacesListSegue" {
            
            self.placesListView = vc
        }
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

