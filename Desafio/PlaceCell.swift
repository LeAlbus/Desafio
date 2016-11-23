//
//  File.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/23/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlaceCell: UITableViewCell{
   
    @IBOutlet var adressLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var icon: UIImageView!
    
    var name: String!
    var adress: String!
    var imageURL: String!
    

    func setBaseValues(placeInfo: [String: AnyObject]){
        
        //FIXME: Convert values to String
        
        name = placeInfo["name"] as! String
        adress = placeInfo["vicinity"] as! String
        imageURL = placeInfo["icon"] as! String
        nameLabel.text = name
        adressLabel.text = adress
        
        icon.downloadedFrom(link: imageURL)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

