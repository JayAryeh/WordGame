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
    
    var initialset: String
    init(Score: Int, initialset: String){
        self.score = Score
       
        self.initialset = initialset
    }
    func compare(comparand: HighScore) -> Int{
        return self.score - comparand.score
    }
}