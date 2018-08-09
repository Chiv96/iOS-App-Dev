//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Chivonne Reji on 8/9/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball8: UIImageView!
    var randomNum : Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askButton(_ sender: Any) {
        askBall()
        
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        askBall()
    }
    func askBall(){
        let ballArray = ["ball1","ball2","ball3","ball4","ball5"];
        randomNum = Int(arc4random_uniform(5))
        ball8.image = UIImage(named: ballArray[randomNum])
    }
    
}

