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
        self.navigationController?.navigationBar.backItem?.title = "Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {

        self.placeNameLabel.text = info["name"] as? String
        self.placeAdressLabel.text = info["vicinity"] as? String
        
        
        if info["open_now"] != nil{
            
            //Set colors based on ideal colors to be background for text. Check clrs.cc for details
            if info["open_now"] as! Bool == true{
                
                isOpenNowView.backgroundColor = UIColor.init(red: 46/255, green: 204/255, blue: 64/255, alpha: 1)
                isOpenNowLabel.text = "OPEN"
            } else {
                isOpenNowView.backgroundColor = UIColor.init(red: 255/255, green: 66/255, blue: 56/255, alpha: 1)
                isOpenNowLabel.text = "CLOSED"
            }
        } else{
            isOpenNowView.backgroundColor = UIColor.lightGray
            isOpenNowLabel.text = "UNKNOWN"
        }
        
        placeIconImageView.downloadedFrom(link: (info?["icon"] as! String))
    }


}
