////
////  placesList.swift
////  Desafio
////
////  Created by Pedro Lopes on 11/23/16.
////  Copyright © 2016 Pedro Lopes. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class PlacesList: UITableView, UITableViewController{
//    
//    var placesCount: Int!
//    
//    func setNumberOfPlaces(numberOfPlaces: Int){
//        
//        placesCount = numberOfPlaces
//
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//   
//        return placesCount
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> PlaceCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath ) as! PlaceCell
//        
//        //cell.setBaseValues(placeInfo: places[indexPath])
//        return cell
//    }
//
//}
