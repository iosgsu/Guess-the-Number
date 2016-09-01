//
//  ViewController.swift
//  Guess The Number
//
//  Created by Alejandrina Patron on 8/30/16.
//  Copyright © 2016 Georgia Tech iOS Club. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!

    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
        //print(numberToGuess)
    }

    @IBAction func submitButtonPressed(sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(guess: Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            guessLabel.text = "Higher! ⬆️"
        } else if guess > numberToGuess {
            guessLabel.text = "Lower! ⬇️"
        } else {
            // You win yay!
            showWinAlert()
            guessLabel.text = "Guess the Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
        guessTextField.text = ""
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Got it", style: .Default) { _ in }
        alert.addAction(action)
        self.presentViewController(alert, animated: true) {}
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! 🎉", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Play again", style: .Default) { _ in }
        alert.addAction(action)
        self.presentViewController(alert, animated: true) {}
    }
    
}