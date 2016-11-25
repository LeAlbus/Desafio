//
//  PlaceView.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/24/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlaceView: UIView{
    
    var name: String?
    var iconURL: String?
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var icon: UIImageView?
    
    @IBAction func placeSelected(sender: UIButton){
        print("Place selected = \(name)")
    }
    
    func setBaseValues(placeInfo: [String: AnyObject]){
     
        self.name = placeInfo["name"] as? String
        self.iconURL = placeInfo["icon"] as? String
        
        self.nameLabel?.text = name
        
        self.icon?.downloadedFrom(link: iconURL!)
    }
    
}
