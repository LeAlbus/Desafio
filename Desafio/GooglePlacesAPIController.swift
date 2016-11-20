//
//  GooglePlacesAPIController.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/19/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import CoreLocation

class GooglePlacesAPIController: NSObject{
    
    var baseRequestURL: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
    let requestType: String = "car_repair" //Type of location to search for
    let rangeToSearch: String = "1000" //Defines distance in meters to search in
    
    
    func requestForLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        
        let latitudeStr: String = String(format: "%f", latitude)
        let longitudeStr: String = String(format: "%f", longitude)

        let locationStr = latitudeStr + "," + longitudeStr
        
        //At this point, the string is exactly the url that returns the json value with the results
        let fullString = self.defineRequestURL(locationStr: locationStr)
        print(fullString)
        self.makeRequest(StringUrl: fullString)
    }
    
    
    func defineRequestURL(locationStr: String) -> String{
        
        //Adds parameters to search
        let requestString: String = baseRequestURL + locationStr + "&radius=" + rangeToSearch + "&type=" + requestType
        
        //Adds the API_KEY
        let requestStringWithAPIKey: String = requestString + "&key=" + Constants.WEB_SERVICE_KEY
        
        return requestStringWithAPIKey
    }
    
    func makeRequest(StringUrl: String)/* -> Data*/{
        
        let urlToRequest: URL = URL(string: StringUrl)!

        let task = URLSession.shared.dataTask(with: urlToRequest) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Empty return from request!")
                return
            }
            
            print (JSON(data: data))
        }


        task.resume()
       // return json

    }
}
