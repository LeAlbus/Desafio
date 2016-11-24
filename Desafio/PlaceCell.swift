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
   
    //@IBOutlet var adressLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var icon: UIImageView!
    
    var name: String!
    var adress: String!
    var imageURL: String!
    

    func setBaseValues(placeInfo: [String: AnyObject]){
        
        //FIXME: Convert values to String
        
        print(placeInfo["name"] as! String)
        
        self.name = placeInfo["name"] as! String
        self.adress = placeInfo["vicinity"] as! String
        self.imageURL = placeInfo["icon"] as! String
        
        self.nameLabel = UILabel()
       // self.adressLabel = UILabel()
        
        self.nameLabel.text = self.name
        //self.adressLabel.text = self.adress
        
        self.icon = UIImageView()
       // icon.downloadedFrom(link: imageURL)
        self.contentView.sizeToFit()
        self.sizeToFit()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if self.name != nil{
            print(self.nameLabel.text)
        }
        
        //print("ALALA")
    }
}

