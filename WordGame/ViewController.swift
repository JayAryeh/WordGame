//
//  ViewController.swift
//  WordGame
//
//  Created by Aryeh Lieberman on 3/28/15.
//  Copyright (c) 2015 JayAryeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var submission: UITextField!
        @IBOutlet weak var picker: UIPickerView!
    private var checker: Checks = Checks()
    private var numberOfLetters: Int = 5
    private var currentLetters: [Character] = []
    private let letters: [Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func submit(sender: AnyObject) {
        submission.resignFirstResponder()
        if checker.CompleteCheck(currentLetters, typedInput: submission.text){
            ++numberOfLetters
            start(numberOfLetters)
            
        }
    }
    
    @IBAction func backGroundTap(sender: AnyObject) {
        submission.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func start(sender: AnyObject) {
        currentLetters.removeAll(keepCapacity: false)
        for  i in 0..<numberOfLetters{
            var a = Int(arc4random_uniform(UInt32(26)))
            
                
            picker.selectRow(a, inComponent: i, animated: true)
            currentLetters.append(letters[a])
            
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
        return String(letters[row])
    }


}

