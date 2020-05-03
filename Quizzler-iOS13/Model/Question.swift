//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by MoHaMeD on 4/13/20.
//  Copyright © 2020 MoHaMeD. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        correct = correctAnswer
    }
}

