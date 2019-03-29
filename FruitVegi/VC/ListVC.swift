//
//  ListVC.swift
//  FruitVegi
//
//  Created by Christopher Hovey on 3/25/19.
//  Copyright © 2019 Chris Hovey. All rights reserved.
//

import UIKit
import CoreData

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("info.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Food] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
//        getItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("my files", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
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
            let food = Food(context: self.context)
            food.name = tfName
            food.cost = tfCost
            food.dateAdded = Date()
            self.items.append(food)
            
            self.saveItems()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
//    func getItems(){
//        if let url = dataFilePath, let data = try? Data(contentsOf: url){
//            let propertyListDecoder = PropertyListDecoder()
//            do{
//                items = try propertyListDecoder.decode([Food].self, from: data)
//                tableView.reloadData()
//            } catch{
//                print("error getting core data", error.localizedDescription)
//            }
//
//        }
//    }
    
    func saveItems(){
        let propertyListEncoder = PropertyListEncoder()
        
        do{
            try context.save()
        } catch{
            print("error encoding docs - ", error)
        }
        tableView.reloadData()
        
    }
}
