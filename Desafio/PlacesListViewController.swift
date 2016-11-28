////
////  placesList.swift
////  Desafio
////
////  Created by Pedro Lopes on 11/23/16.
////  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlacesListViewController: UIViewController{
    
    let infoSegueIdentifier = "showPlaceInfoSegue"
    var placesInfoView: PlaceInfoViewController!
    var placeSelectedInfo: [String: AnyObject]!

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
        tableView.dataSource = dataSource as UITableViewDataSource?
        
        //Reloads the tableView Content
        tableView.reloadData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Called before ViewDidLoad
        
        
        
        if  segue.identifier == infoSegueIdentifier,
            let vc = segue.destination as? PlaceInfoViewController,
            let cellIndex = tableView.indexPathForSelectedRow?.row{
            
            vc.info = self.dataSource?.getPlaceAt(position: cellIndex)
        }
      
    }
}
