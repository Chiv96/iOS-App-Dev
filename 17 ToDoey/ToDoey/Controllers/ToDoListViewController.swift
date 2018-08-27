//
//  ViewController.swift
//  ToDoey
//
//  Created by Chivonne Reji on 8/26/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    //var itemArray = ["Get curtains", "Buy cereal", "Download This is Us"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Get curtains"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy cereal"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Download This is Us"
        itemArray.append(newItem3)
        
        
        if let items = defaults.array(forKey: "ToDoListItems") as? [Item] {
            itemArray = items
        }
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
       
        itemArray[indexPath.row].done = !(itemArray[indexPath.row].done)
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happends when user clicks "Add Item"
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            //the alertTextField is created locally inside this closure
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
}
