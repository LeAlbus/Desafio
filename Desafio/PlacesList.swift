//
//  placesList.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/23/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit
//FIXME: cell not changing name label text, but shows right when print

class PlacesListDelegate: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet var tableView: UITableView!

    var places = [[String: AnyObject]]()

    func setBaseValues(placesData: [[String: AnyObject]]){
        
        
        places = placesData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Registering the PlaceCell as the usable cell for the identifier "placeCell"
        //MARK: adding this line hides the content of the cells
        //tableView.register(PlaceCell.classForCoder(), forCellReuseIdentifier: "placeCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: TableViewController related functions
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath ) as! PlaceCell
        if cell == nil {
            cell = PlaceCell(style: UITableViewCellStyle.default, reuseIdentifier: "placeCell")
        }
        print(places[indexPath.row])
        cell.setBaseValues(placeInfo: places[indexPath.row])
        cell.nameLabel.text = " ahahaha"
        cell.reloadInputViews()
        

        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    

}
