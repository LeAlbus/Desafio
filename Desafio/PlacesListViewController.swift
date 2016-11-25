//
//  PlacesListViewController.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/24/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class PlacesListViewController: UIViewController{
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: ContentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func populate(places: [[String: AnyObject]]){
        
        for place in places{
            
            let newPlaceView: PlaceView = PlaceView()
            newPlaceView.setBaseValues(placeInfo: place)
            print(self.contentView)
            self.contentView.addSubview(newPlaceView)
        }
    }
    
//    override func viewDidLayoutSubviews() {
//        
//        //Setting constraints
//        var scrollViewInsets = UIEdgeInsets.zero
//        scrollViewInsets.top = scrollView.bounds.size.height/2.0;
//        scrollViewInsets.top -= contentView.bounds.size.height/2.0;
//        
//        scrollViewInsets.bottom = scrollView.bounds.size.height/2.0
//        scrollViewInsets.bottom -= contentView.bounds.size.height/2.0;
//        scrollViewInsets.bottom += 1
//        
//        scrollView.contentInset = scrollViewInsets
//    }
}
