//
//  JSONParser.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/20/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation

class JSONParser: NSObject{
    
    var places = [[String: AnyObject]]()
    
    func readPlaces(json: JSON) -> [[String: AnyObject]]{
       // print(json)
        if json["status"].stringValue == "OK"{
        
            if json["next_page_token"].exists(){
                //print(json["next_page_token"])
            }
            
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
            
            //TODO: Check other pages
            
            return places

        }
         
        return []
        
    }
    
}
