//
//  Question.swift
//  Quizzler
//
//  Created by Chivonne Reji on 8/13/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    //properties
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
