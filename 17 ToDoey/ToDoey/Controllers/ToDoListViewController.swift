//
//  ViewController.swift
//  ToDoey
//
//  Created by Chivonne Reji on 8/26/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    //1 var itemArray = ["Get curtains", "Buy cereal", "Download This is Us"]
    //2 let defaults = UserDefaults.standard
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //These hardcoded items are already saved in the plist file.xs
//        let newItem = Item()
//        newItem.title = "Get curtains"
//        itemArray.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "Buy cereal"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "Download This is Us"
//        itemArray.append(newItem3)
        
// 2       if let items = defaults.array(forKey: "ToDoListItems") as? [Item] {
//           itemArray = items
//        }
        loadItems()
    }
    
    //Table View Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //ternary expression
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }

    //Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        ßitemArray[indexPath.row].done = !(itemArray[indexPath.row].done)
        //can even do itemArray[indexPath.row].setValue()
        
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happends when user clicks "Add Item"
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
           //2 self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.saveItems()    //whenever inside closure, use keyword "self"
        }
        
        alert.addTextField { (alertTextField) in
            //the alertTextField is created locally inside this closure
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Encoding Error")
        }
        self.tableView.reloadData()
    }
    
    func loadItems() {
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching request")
        }
    }
    
}
