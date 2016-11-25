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
        
//        tableView.estimatedRowHeight = 60
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.dataSource = dataSource as! UITableViewDataSource?
//        tableView.reloadData()
    }
    
    func initDataSource(places: [[String: AnyObject]]){
        
        self.dataSource = PlaceCellDataSource(places: places)
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = dataSource as! UITableViewDataSource?
        tableView.reloadData()
    }
}
