//
//  JSONParser.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/20/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation

class JSONParser: NSObject{
    
    //Singleton
    static let sharedInstance = JSONParser()
    
    func readPlaces(json: JSON) -> [[String: AnyObject]]{
        
        var places = [[String: AnyObject]]()
        
        if json["status"].stringValue == "OK"{
            
            for result in json["results"].arrayValue{

                //Filreting for usefull informations
                var place = [String: AnyObject]()

                place["name"] = result["name"] as AnyObject?
                place["icon"] = result["icon"] as AnyObject?
                //MARK: Not all the results show the open now information. Check for null result
                place["open_now"] = result["opening_hours"]["open_now"] as AnyObject?
                place["vicinity"] = result["vicinity"] as AnyObject?

                places.append(place)
            }
            
            //MARK: Appending next pages, if there are more then 20 results
            
            if json["next_page_token"].exists(){
                
                let nextPageToken = json["next_page_token"].stringValue
                
                let newJSON: JSON = GooglePlacesAPIController.sharedInstance.readNewPageWith(token: nextPageToken)
                
                let nextPage: [[String: AnyObject]] = self.readPlaces(json: newJSON)
                
                places.append(contentsOf: nextPage)
            }
            
            return places

        }
         
        return []
        
    }
    
}
