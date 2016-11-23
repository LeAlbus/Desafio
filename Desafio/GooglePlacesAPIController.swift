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
    
    //Singleton
    static let sharedInstance = GooglePlacesAPIController()

    
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
    
    func readNewPageWith(token: String) -> JSON{
        //Function called to read a new page when there are more than 20 results
        
        let newPageURL: String = baseRequestURL + "pagetoken=" + token
        let newPageURLWithKey: String = newPageURL + "&key=" + Constants.WEB_SERVICE_KEY
        
        return self.makeRequest(StringUrl: newPageURLWithKey)
    }
    
    func makeRequest(StringUrl: String) -> JSON{
        
        var json: JSON!
        let urlToRequest: URL = URL(string: StringUrl)!
        //print(urlToRequest)
        var requestComplete: Bool = false
        
        let urlRequest: URLRequest = URLRequest(url: urlToRequest)
        let session = URLSession.shared
        
 
    
        //MARK: Asynchronous request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("File downloaded successfully.")
                json = JSON(data: data! as Data)
                requestComplete = true
            }
        }
        
        task.resume()
        
        
        while(!requestComplete){

            
            /*
             * Check if request was already answered
             *
             * This block is necessary due to the delay for the Google Places API
             * to generate the pages following the first one,
             * if there are more then 20 results
             */
            
            sleep(UInt32(0.3))
        }
        
        return json

    }
}
