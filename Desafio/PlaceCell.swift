//
//  PlaceCell.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/25/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlaceCell: UITableViewCell{
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    var placeInfo: [String: AnyObject]?{
        didSet{
            placeNameLabel.text = (placeInfo?["name"] as! String)
            
            iconView.downloadedFrom(link: (placeInfo?["icon"] as! String))
        }
    }
    
    func presentInformation(){
        
        
    }
}
