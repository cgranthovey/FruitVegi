//
//  FoodPriceCell.swift
//  FruitVegi
//
//  Created by Christopher Hovey on 3/26/19.
//  Copyright © 2019 Chris Hovey. All rights reserved.
//

import UIKit
import CoreData

class FoodPriceCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    @IBOutlet weak var lblDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(food: Food){
        lblName.text = food.name
        lblCost.text = food.cost
        
        
        let format = DateFormatter()
        format.dateStyle = .short
        if let date = food.dateAdded{
            lblDate.text = format.string(from: date)
        }
    }

}
