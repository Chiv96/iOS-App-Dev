//
//  ViewController.swift
//  RemindMe
//
//  Created by Chivonne Reji on 8/19/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, newReminder {
   
    var titles = [String]()
    var descriptions = [String]()
    

    @IBOutlet weak var tableView: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! CustomTableViewCell
        let title = titles[indexPath.row]
        let desc = descriptions[indexPath.row]
        cell.cellTitle.text = title
        cell.cellDescription.text = desc
        return cell
    }
    
    func addNewReminder(title: String, description: String) {
        titles.append(title)
        descriptions.append(description)
        self.tableView .reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecond"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.delegate = self
        }
    }
    

}

