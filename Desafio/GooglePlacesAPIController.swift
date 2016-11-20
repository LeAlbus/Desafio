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
    
    var baseRequestURL: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
    let requestType: String = "&type=car_repair" //Type of location to search for
    let rangeToSearch: String = "&radius=1000" //Defines distance in meters to search in
    
    
    func requestForLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> JSON{
        
        let latitudeStr: String = String(format: "%f", latitude)
        let longitudeStr: String = String(format: "%f", longitude)

        let locationStr = "location=" + latitudeStr + "," + longitudeStr
        
        //At this point, the string is exactly the url that returns the json value with the results
        let fullString = self.defineRequestURL(locationStr: locationStr)

        let jsonResponse = self.makeRequest(StringUrl: fullString)
        return jsonResponse;
    }
    
    
    func defineRequestURL(locationStr: String) -> String{
        
        //Adds parameters to search
        let requestString: String = baseRequestURL + locationStr + rangeToSearch  + requestType
        
        //Adds the API_KEY
        let requestStringWithAPIKey: String = requestString + "&key=" + Constants.WEB_SERVICE_KEY
        
        return requestStringWithAPIKey
    }
    
    func makeRequest(StringUrl: String) -> JSON{
        
        var json: JSON!
        let urlToRequest: URL = URL(string: StringUrl)!
        
        if let data = try? NSData(contentsOf: urlToRequest, options: []) {
            json = JSON(data: data as Data)
        }
        return json

    }
}
