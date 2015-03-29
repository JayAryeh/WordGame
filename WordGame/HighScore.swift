//
//  HighScore.swift
//  WordGame
//
//  Created by Aryeh Lieberman on 3/29/15.
//  Copyright (c) 2015 JayAryeh. All rights reserved.
//

import Foundation
class HighScore{
    var score: Int
    var name: String
    var initialset: String
    init(Score: Int, initialset: String, Name: String){
        self.score = Score
        self.name = Name
        self.initialset = initialset
    }
    func compare(comparand: HighScore) -> Int{
        return self.score - comparand.score
        
    }
}