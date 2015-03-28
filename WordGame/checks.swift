//
//  checks.swift
//  WordGame
//
//  Created by Jay Maxwell on 3/28/15.
//  Copyright (c) 2015 JayAryeh. All rights reserved.
//

import Foundation
import UIKit

class Checks{
    
    var pickerStuff: [Character] = []
    var typedStuff: String = ""
    var chars: [Character] = []
    var checker:UITextChecker = UITextChecker()
    var textLength:Int = 0
    var checkRange:NSRange
    var misspelledRange:NSRange
    
  init(picker: [Character], typedInput: String){
        pickerStuff = picker
        typedStuff = typedInput
        chars = Array(typedStuff)
        textLength = chars.count
        checkRange = NSMakeRange(0, textLength)
         misspelledRange = checker.rangeOfMisspelledWordInString(typedStuff, range: checkRange, startingAt: checkRange.location, wrap: false, language: "en_Us")
    }
    
    
    
    
    



    

    
    
    func allLetterAreThere()->Bool{
        var numToGet = chars.count
        var count = 0
        
        for i in 0...(chars.count-1) {
            for p in 0...(pickerStuff.count-1){
                if (chars[i] == pickerStuff[p]) {
                    count++
                    pickerStuff.removeAtIndex(p)
                    break
                }
                
            }
        }
        if(count >= numToGet){
            return true
        }
        return false
    }
    
    func spellCheck()->Bool{
        if (misspelledRange.length == 0){
            return true
        }
        return false
    }
    
    
    func CompleteCheck()->Bool{
        if( allLetterAreThere()&&spellCheck()){
        return true
        }
        return false
    }

    
    
    





}