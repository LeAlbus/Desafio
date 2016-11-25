//
//  ContentView.swift
//  Desafio
//
//  Created by Pedro Lopes on 11/24/16.
//  Copyright © 2016 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class ContentView: UIView{
    
    var placesNumber = 0
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        print("WOLOLO")
        view.center.x = self.center.x
        view.center.y = (CGFloat(placesNumber + 1)) * (view.bounds.height + 8)
        
        self.placesNumber += 1
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        self.placesNumber -= 1
    }
    
    func clearList (){
        
        for view in subviews{
            view.removeFromSuperview()
        }
    }
}
