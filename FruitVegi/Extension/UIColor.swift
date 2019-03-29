//
//  UIColor.swift
//  FruitVegi
//
//  Created by Christopher Hovey on 3/28/19.
//  Copyright © 2019 Chris Hovey. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    func getColor (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    
}
