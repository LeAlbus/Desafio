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
    
    //@IBOutlet var backButton: UIBarButtonItem!
//    
//    @IBAction func dismissView(_ sender: AnyObject) {
//        
//        self.dismissView(sender)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //backButton.action = Selector(("dismissView"))
    }
    
    func dismissView(_ sender: AnyObject) {
        
        self.dismissView(sender)
    }

}

//let modalVC = ModalVC.instantiateFromStoryboard(self.storyboard!)
//self.presentViewController(modalVC, animated: true, completion: nil)
