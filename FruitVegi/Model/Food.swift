//
//  Food
//  FruitVegi
//
//  Created by Christopher Hovey on 3/26/19.
//  Copyright © 2019 Chris Hovey. All rights reserved.
//

import Foundation

class Food: Encodable{
    
    fileprivate var _name: String
    fileprivate var _cost: String
    fileprivate var _dateAdded: Date
    
    var name: String{
        return _name
    }
    var cost: String{
        return _cost
    }
    var dateAdded: Date{
        return _dateAdded
    }
    
    
    init(name: String, cost: String, dateAdded: Date){
        _name = name
        _cost = cost
        _dateAdded = dateAdded
    }
}
