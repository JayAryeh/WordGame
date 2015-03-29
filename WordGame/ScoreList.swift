//
//  ScoreList.swift
//  WordGame
//
//  Created by Aryeh Lieberman on 3/29/15.
//  Copyright (c) 2015 JayAryeh. All rights reserved.
//

import Foundation
class ScoreList{
    class var scorelist: ScoreList{
        struct Singleton{
            static let instance = ScoreList()
            
        }
        return Singleton.instance
        
    }
    
    var scoreList: [HighScore]{
        didSet{
            scoreList.sort{$0.score - $1.score > 0}

            
        }
    }
     init(){
        scoreList = []
    }
    
    func save(){
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path = paths[0].stringByAppendingPathComponent("colonies")
        NSKeyedArchiver.archiveRootObject(scoreList, toFile: path)
        
    }
    func unArchiving(){
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path = paths[0].stringByAppendingPathComponent("colonies")
        if let archived = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [HighScore]{
            scoreList = archived
            
        }
    }

}