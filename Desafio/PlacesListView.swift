////
////  placesList.swift
////  Desafio
////
////  Created by Pedro Lopes on 11/23/16.
////  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlacesListView: UITableView{
    
    let infoSegueIdentifier = "showPlaceInfoSegue"
    var placesInfoView: PlaceInfoViewController!
    var placeSelectedInfo: [String: AnyObject]!

    var newDataSource: PlaceCellDataSource?

    //@IBOutlet weak var tableView: UITableView!
    
    func initDataSource(places: [[String: AnyObject]]){
        
        //Initializes dataSource
        self.newDataSource = PlaceCellDataSource(places: places)
        
        //Sets the values in order to make the Cell increase size
        self.estimatedRowHeight = 60
        self.rowHeight = UITableViewAutomaticDimension
        
        //Sets the dataSource
        self.dataSource = newDataSource as UITableViewDataSource?
        
        //Reloads the tableView Content
        self.reloadData()
    }

}
