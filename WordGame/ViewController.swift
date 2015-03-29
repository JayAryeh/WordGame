//
//  ViewController.swift
//  WordGame
//
//  Created by Aryeh Lieberman on 3/28/15.
//  Copyright (c) 2015 JayAryeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBAction func giveUp(sender: UIButton) {
        score = 0
        var sum = 0
        for i in words.componentsSeparatedByString("\n"){
            for j in Array(i){
                sum += letterScores[j]!
            }
            score += sum * sum
            sum = 0
        }
        score = score - ( Array(lettersLabel.text!).count)
        let alertController = UIAlertController(title: "Score: \(score)", message:
            "you found: \(wordsLabel.text!)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "I agree completely good sir", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        start()
        wordCount = 0
        words = ""
        
        wordsLabel.text = ""
            }
    @IBOutlet weak var submission: UITextField!
    @IBOutlet weak var WinningLabel: UILabel!
    @IBOutlet weak var lettersLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    private var initialSet: String?
    private var words: String = ""
    private var space: Character = " "
    private var wordCount = 0
    private var score = 0
    private var checker: Checks = Checks()
    private var numberOfLetters: Int = 24
    private var currentLetters: [Character] = []
    private let letters: [Character] =
    ["e","e","e","e","e","e","e","e","e","e","a","a","a","a","a","a","a","a","a","i","i","i","i","i","i","i","i","i","o","o","o","o","o","o","o","o","n","n","n","n","n","n","r","r","r","r","r","r","t","t","t","t","t","t","l","l","l","l","s","s","s","s","u","u","u","u","d","d","d","d","g","g","g","b","b","c","c","m","m","p","p","f","f","h","h","v","v","w","w","y","y","k","j","x"]
    private let letterScores: [Character: Int] = ["a": 1,"b":3,"c": 3,"d":2,"e":1,"f":4,"g":2,"h":4,"i":1,"j":8,"k":10,"l":1,"m":3,"n":1,"o":1,"p":3,"q":10,"r":1,"s": 1,"t":1,"u":1,"v":4,"w":4,"x":8,"y":4,"z":10]
    private var currentRows: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submit(sender: UITextField) {
        if(submission.text != nil && submission.text != ""){
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
        
                    lettersLabel.text = " "
            if(currentLetters.count != 0){
        for i in 0...(currentLetters.count-1){
            lettersLabel.text?.append(currentLetters[i])
            lettersLabel.text?.append(space)
                }}
        //start()
        submission.text = ""
        wordCount++
               // round.text = "Words: \(wordCount)"
            }
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
        
        for  i in 0..<numberOfLetters{
            lettersLabel.text = ""
            var a = Int(arc4random_uniform(UInt32(letters.count)))
            currentLetters.append(letters[a])
                    }
        
        for i in 0...(currentLetters.count-1){
            lettersLabel.text?.append(currentLetters[i])
            lettersLabel.text?.append(space)
        }
        println(currentLetters)
       initialSet = "hi"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "score"){
            if let a = segue.destinationViewController as? HighScoreTableViewController{
                a.scoreList.append(HighScore(Score: score, initialset: initialSet!))
            print("hahahaha")}
        }
            }
   

}

