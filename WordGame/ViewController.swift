//
//  ViewController.swift
//  WordGame
//
//  Created by Aryeh Lieberman on 3/28/15.
//  Copyright (c) 2015 JayAryeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var submission: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var WinningLabel: UILabel!
    @IBOutlet weak var lettersLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    
    private var words: String = ""
    private var space: Character = " "
    private var wordCount = 0
    private var score = 0
    private var checker: Checks = Checks()
    private var numberOfLetters: Int = 24
    private var currentLetters: [Character] = []
    private let letters: [Character] = ["e","e","e","e","e","e","e","e","e","e","a","a","a","a","a","a","a","a","a","i","i","i","i","i","i","i","i","i","o","o","o","o","o","o","o","o","n","n","n","n","n","n","r","r","r","r","r","r","t","t","t","t","t","t","l","l","l","l","s","s","s","s","u","u","u","u","d","d","d","d","g","g","g","b","b","c","c","m","m","p","p","f","f","h","h","v","v","w","w","y","y","k","j","x"]
    private let letterScores: [Character: Int] = ["a": 1,"b":3,"c": 3,"d":2,"e":1,"f":4,"g":2,"h":4,"i":1,"j":8,"k":10,"l":1,"m":3,"n":1,"o":1,"p":3,"q":10,"r":1,"s": 1,"t":1,"u":1,"v":4,"w":4,"x":8,"y":4,"z":10]
    private var currentRows: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submit(sender: UITextField) {
        
        submission.resignFirstResponder()
        
        if checker.CompleteCheck(currentLetters, typedInput: submission.text){
            words += submission.text
            words += "\n"
            wordsLabel.text = words
            println("true")
            WinningLabel.text = "Nice!"
            WinningLabel.textColor = UIColor.greenColor()
            removeLetters(currentLetters, typedInput: submission.text)
        }else{
            numberOfLetters--
            println("false")
            WinningLabel.text = "Nope!"
            WinningLabel.textColor = UIColor.redColor()
            
        }
        score += Array(submission.text).count
        picker.reloadAllComponents()
            lettersLabel.text = " "
        for i in 0...(currentLetters.count-1){
            lettersLabel.text?.append(currentLetters[i])
            lettersLabel.text?.append(space)
        }
        //start()
        submission.text = ""
        wordCount++
        scoreLabel.text = "Score: \(wordCount)"
       // round.text = "Words: \(wordCount)"
            }
    
    func removeLetters(lettersinlist: [Character],typedInput: String){
        var typedInputToArray = Array(typedInput)
        var counting = 0
        for i in 0...(typedInputToArray.count-1) {
            for p in 0...(currentLetters.count-1){
                if (typedInputToArray[i] == currentLetters[p]) {
                        counting++
                        currentLetters.removeAtIndex(p)
                        break
                }
            }
        }
        
    
    }
    
    @IBAction func backGroundTap(sender: AnyObject) {
        submission.resignFirstResponder()
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func start() {
        currentLetters.removeAll(keepCapacity: false)
        currentRows = []
        for  i in 0..<numberOfLetters{
            lettersLabel.text = ""
            var a = Int(arc4random_uniform(UInt32(letters.count)))
            
                
            picker.selectRow(a, inComponent: i, animated: true)
            currentLetters.append( Character(pickerView(picker, titleForRow: a, forComponent: i)) )
            currentRows.append(a)
            
        }
        
        for i in 0...(currentLetters.count-1){
            lettersLabel.text?.append(currentLetters[i])
            lettersLabel.text?.append(space)
        }
        println(currentLetters)
        
    }
    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return numberOfLetters   }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letters.count
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(letters[row])
    }


}

