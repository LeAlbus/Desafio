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

class ViewController: UITableViewController, CLLocationManagerDelegate {
 
    @IBOutlet var placesList: UITableView!
    @IBOutlet var refreshButton: UIButton!
    
    var places = [[String: AnyObject]]()
    
    var locationManager: CLLocationManager!
    var currentUserLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()

       // placesClient = GMSPlacesClient.shared()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        tableView.register(PlaceCell.classForCoder(), forCellReuseIdentifier: "placeCell")

    }
    
    func runSearch(){
        
        //setting user location
        currentUserLocation = self.locationManager.location!
        
        let latitude = currentUserLocation?.coordinate.latitude
        let longitude = currentUserLocation?.coordinate.longitude
        
        //Request nearby garages
        let rawJson = GooglePlacesAPIController.sharedInstance.requestForLocation(latitude: latitude!, longitude: longitude!)
        
        places = JSONParser.sharedInstance.readPlaces(json: rawJson)
        
        if places.isEmpty{
            
        } else{
            print("RELOADING")
            self.tableView.reloadData()
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
    
    //MARK: TableViewController related functions 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(places.count)
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> PlaceCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath ) as! PlaceCell
        print(places[indexPath.row])
        cell.setBaseValues(placeInfo: places[indexPath.row])
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

