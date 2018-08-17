//
//  ViewController.swift
//  Segues Practice
//
//  Created by Chivonne Reji on 8/17/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen"{
            //access the second VC's properties
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.textPassedOver = text.text!
        }
    }

}

