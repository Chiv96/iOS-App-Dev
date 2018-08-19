//
//  SecondViewController.swift
//  RemindMe
//
//  Created by Chivonne Reji on 8/19/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import UIKit

protocol newReminder{
    func addNewReminder(title : String, description : String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    var delegate : newReminder?
    

    @IBAction func addNew(_ sender: UIButton) {
        let title = titleText.text!
        let description = descriptionText.text!
        delegate?.addNewReminder(title: title, description: description)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
