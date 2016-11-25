//
//  PlaceInfoViewController.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/25/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlaceInfoViewController: UIViewController{
    
    @IBOutlet var isOpenNowView: UIView!
    @IBOutlet var isOpenNowLabel: UILabel!
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var placeAdressLabel: UILabel!
    @IBOutlet var placeIconImageView: UIImageView!
    
    var info: [String: AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setInfo (info: [String:AnyObject]){
        
        //self.info = info
        
        self.placeNameLabel.text = (info ["name"] as! String)
    }
    
    func dismissView(_ sender: AnyObject) {
        
        self.dismissView(sender)
    }

}
