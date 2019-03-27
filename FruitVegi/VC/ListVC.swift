//
//  ListVC.swift
//  FruitVegi
//
//  Created by Christopher Hovey on 3/25/19.
//  Copyright © 2019 Chris Hovey. All rights reserved.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("info.plist")
    
    
    var items: [Food] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        


        items.append(Food.init(name: "Broccoli", cost: "$5/lb", dateAdded: Date()))
        items.append(Food.init(name: "Carrot", cost: "$9/lb", dateAdded: Date()))
        let date = Date.init(timeIntervalSinceNow: -1000000)
        items.append(Food.init(name: "Bell Pepper Red", cost: "$1 for 1", dateAdded: date))
        // Do any additional setup after loading the view.
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("printing cell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FoodPriceCell{
            print("printing cell1")
            cell.configure(food: items[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("items count - ", items.count)
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func plusButtonPress(_ sender: AnyObject){
        showAddAlert()
    }

    func showAddAlert(){
        let alertController = UIAlertController(title: "Add Food Item", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Food Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Cost and Quantity"
        }
        alertController.addAction(UIAlertAction.init(title: "Add", style: .default, handler: { (action) in
            guard let tfs = alertController.textFields, tfs.count == 2, let tfName = tfs[0].text, let tfCost = tfs[1].text else{
                return
            }
            
            print("the tf text", tfName, tfCost)
            let food = Food(name: tfName, cost: tfCost, dateAdded: Date())
            self.items.append(food)
            
            self.saveItems()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    func saveItems(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(self.items)
            if let path = self.dataFilePath{
                try data.write(to: path)
            }
        } catch {
            print("food encode error: ", error.localizedDescription)
        }
        tableView.reloadData()
    }
}
