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
        print(ScoreList.scorelist.scoreList.count)
        let alertController = UIAlertController(title: "Score: \(score)", message:
            "you're name? \(wordsLabel.text!)", preferredStyle: UIAlertControllerStyle.Alert)
       
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
        let loginAction = UIAlertAction(title: "continue", style: .Default) { (_) in
            let loginTextField = alertController.textFields![0] as UITextField
            
            self.name = loginTextField.text
            ScoreList.scorelist.scoreList.append(HighScore(Score: self.score, Name: self.name))
                              }
        loginAction.enabled = false
        
        let forgotPasswordAction = UIAlertAction(title: "Forgot Password", style: .Destructive) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Name"
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                loginAction.enabled = textField.text != ""
            }
        }
        alertController.addAction(loginAction)
        ScoreList.scorelist.scoreList.append(HighScore(Score: score, Name: self.name))
        println(self.name)
        start()
        wordCount = 0
        words = ""
        
        wordsLabel.text = ""
        ScoreList.scorelist.save()
        
            }
    var name = ""
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
        ScoreList.scorelist.unArchiving()
        start()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submit(sender: UITextField) {
        var arrayforcount = Array(submission.text)
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
            if (arrayforcount.count<3){
                WinningLabel.text = "Use at least 3 letters"
            }
            else if (checker.spellCheck() == false)&&(checker.allLetterAreThere() == false){
                WinningLabel.text = "Those Letters aren't There!\nAnd thats not a word!"
            }
            else if checker.spellCheck(){
                WinningLabel.text = "Those Letters aren't There!"
            }
            else if checker.allLetterAreThere(){
                WinningLabel.text = "Thats not a word!"
            }
            
            WinningLabel.textColor = UIColor.blackColor()
            
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
   
}

