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
    
    private var roundNumber = 0
    private var score = 0
    private var checker: Checks = Checks()
    private var numberOfLetters: Int = 8
    private var currentLetters: [Character] = []
    private let letters: [Character] = ["e","e","e","e","e","e","e","e","e","e","a","a","a","a","a","a","a","a","a","i","i","i","i","i","i","i","i","i","o","o","o","o","o","o","o","o","n","n","n","n","n","n","r","r","r","r","r","r","t","t","t","t","t","t","l","l","l","l","s","s","s","s","u","u","u","u","d","d","d","d","g","g","g","b","b","c","c","m","m","p","p","f","f","h","h","v","v","w","w","y","y","k","j","x"]
    private var currentRows: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //start()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submit(sender: UITextField) {
        start()
        submission.resignFirstResponder()
        print("ha")
        if checker.CompleteCheck(currentLetters, typedInput: submission.text){
            println("true")
            WinningLabel.text = "Nice!"
            WinningLabel.textColor = UIColor.greenColor()
            
        }else{
            numberOfLetters--
            println("false")
            WinningLabel.text = "Better Luck Next Time"
            WinningLabel.textColor = UIColor.redColor()
            
        }
        score += Array(submission.text).count
        picker.reloadAllComponents()
        start()
        submission.text = ""
        roundNumber++
        scoreLabel.text = "Score: \(score)"
        round.text = "Round: \(roundNumber)"
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
            var a = Int(arc4random_uniform(UInt32(letters.count)))
            
                
            picker.selectRow(a, inComponent: i, animated: true)
            currentLetters.append(letters[a])
            currentRows.append(a)
            
        }
        println(currentLetters)
        
    }
    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return numberOfLetters   }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 26
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(letters[Int(arc4random_uniform(UInt32(letters.count)))])
    }


}

