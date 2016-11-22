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
        
        var requestComplete: Bool = false
        
        let urlRequest: URLRequest = URLRequest(url: urlToRequest)
        let session = URLSession.shared
        
        //MARK: Asynchronous request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                json = JSON(data: data! as Data)
                requestComplete = true
            }
        }
        
        task.resume()
        
        //check if request was already answered
        while(!requestComplete){
            sleep(UInt32(0.3))
        }
        return json

    }
}
