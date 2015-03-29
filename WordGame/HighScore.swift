//
//  HighScore.swift
//  WordGame
//
//  Created by Aryeh Lieberman on 3/29/15.
//  Copyright (c) 2015 JayAryeh. All rights reserved.
//

import Foundation
class HighScore: NSObject, NSCoding{
    var score: Int
    var name: String
    var initialset: String
    override init(){
        self.score = 0
        self.name = ""
        self.initialset = ""
    }
    init(Score: Int, initialset: String, Name: String){
        self.score = Score
        self.name = Name
        self.initialset = initialset
    }
    func compare(comparand: HighScore) -> Int{
        return self.score - comparand.score
        
    }
    // MARK: NSCoding
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        //self.title = decoder.decodeObjectForKey("title") as String?
        self.score = decoder.decodeObjectForKey("score") as Int
        self.name = decoder.decodeObjectForKey("name") as String
        self.initialset = decoder.decodeObjectForKey("initialset") as String
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        // coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.score, forKey: "score")
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.initialset, forKey: "initialset")
        
    }
}