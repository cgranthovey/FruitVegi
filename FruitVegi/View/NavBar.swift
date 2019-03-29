//
//  NavBar.swift
//  FruitVegi
//
//  Created by Christopher Hovey on 3/25/19.
//  Copyright © 2019 Chris Hovey. All rights reserved.
//

import UIKit

class NavBar: UINavigationController {
    
    override func awakeFromNib() {
//        navigationBar.barStyle = .black
        
        navigationBar.barTintColor = UIColor().getColor(red: 255, green: 225, blue: 53, alpha: 1)
        
//        navigationBar.isTranslucent = false
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    

}
