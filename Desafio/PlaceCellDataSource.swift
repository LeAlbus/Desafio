//
//  PlaceCellDataSource.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/25/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlaceCellDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    let places: [[String: AnyObject]]
    
    var selectedInfo: [String: AnyObject]!
    
    init(places: [[String: AnyObject]]) {
        self.places = places
    }
    
    func getPlaces() -> [[String: AnyObject]]{
        return places
    }
    
    func getPlaceAt(position: Int) -> [String: AnyObject]{
        return places[position]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell") as! PlaceCell
        let place = places[indexPath.row]
        cell.placeInfo = place
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        self.selectedInfo = places[indexPath.row]
    }

}
