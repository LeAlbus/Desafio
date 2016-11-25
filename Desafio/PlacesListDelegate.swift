////
////  placesList.swift
////  Desafio
////
////  Created by Pedro Lopes on 11/23/16.
////  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlacesListDelegate: UIViewController{
    
    
    var dataSource: PlaceCellDataSource?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initDataSource(places: [[String: AnyObject]]){
        
        //Initializes dataSource
        self.dataSource = PlaceCellDataSource(places: places)
        
        //Sets the values in order to make the Cell increase size
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Sets the dataSource
        tableView.dataSource = dataSource as! UITableViewDataSource?
        
        //Reloads the tableView Content
        tableView.reloadData()
    }
}
