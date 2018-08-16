//
//  Car.swift
//  Classes and Objects
//
//  Created by Chivonne Reji on 8/16/18.
//  Copyright © 2018 Chivonne Reji. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var colour = "Black"
    var numberOfSeats = 5
    var typeOfCar : CarType = .Coupe
    
    init(){
        
    }
    
    convenience init(customerChosenColour : String, customerChosenTypeOfCar : CarType){
        self.init()
        colour = customerChosenColour
        typeOfCar = customerChosenTypeOfCar
    }
    
    func drive(){
        print("Car is moving")
    }
    
}
