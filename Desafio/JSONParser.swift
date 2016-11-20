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
        
        if json["status"].stringValue == "OK"{
        
            if json["next_page_token"].exists(){
                print(json["next_page_token"])
            }
        }
         
        return []
        
    }
    
}
