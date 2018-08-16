//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Chivonne Reji on 8/16/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car{
    
    var destination : String?
    
    override func drive(){
        super.drive()
        if destination != nil {
            print("Driving towards " + destination!)
        }
    }
    
}
