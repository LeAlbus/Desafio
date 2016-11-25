//
//  PlaceCellDataSource.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/25/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlaceCellDataSource: NSObject, UITableViewDataSource {
    let places: [[String: AnyObject]]
    
    init(places: [[String: AnyObject]]) {
        self.places = places
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
}
