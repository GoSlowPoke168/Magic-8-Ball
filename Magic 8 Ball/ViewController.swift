//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Jeremy on 7/5/20.
//  Copyright © 2020 Jeremy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let answers = ["It is certain", "It is decidedly   so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy, try again", "Ask again later", "Better not tell you    now", "Cannot predict    now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
     
    let noInputAnswers = ["I can't read your mind", "No question, no answer", "Type in a      question"]
    
    let animationDuration = 1.5

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionBox: UITextField!
    
    @IBAction func askButtonClicked(_ sender: Any) {
        if questionBox.text != ""{
            if let randomAnswer = answers.randomElement(){
                fadeViewOut(view: answerLabel, delay: 0)
                print(randomAnswer)
                answerLabel.text = randomAnswer
                fadeViewIn(view: answerLabel, delay: 0)
            }
        }else {
            if let randomAnswer = noInputAnswers.randomElement(){
                fadeViewOut(view: answerLabel, delay: 0)
                print(randomAnswer)
                answerLabel.text = randomAnswer
                fadeViewIn(view: answerLabel, delay: 0)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func fadeViewIn(view : UIView, delay: TimeInterval) {
        UIView.animate(withDuration: animationDuration, delay: delay, options: .curveEaseIn, animations: {
            view.alpha = 1
        }, completion: nil)
    }
    
    func fadeViewOut(view : UIView, delay: TimeInterval) {
        UIView.animate(withDuration: animationDuration, delay: delay, options: .curveEaseIn, animations: {
            view.alpha = 0
        }, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            print("Device was shaken")
            questionBox.resignFirstResponder()
            if questionBox.text != ""{
                if let randomAnswer = answers.randomElement(){
                    fadeViewOut(view: answerLabel, delay: 0)
                    print(randomAnswer)
                    answerLabel.text = randomAnswer
                    fadeViewIn(view: answerLabel, delay: 0)
                }
            }else {
                if let randomAnswer = noInputAnswers.randomElement(){
                    fadeViewOut(view: answerLabel, delay: 0)
                    print(randomAnswer)
                    answerLabel.text = randomAnswer
                    fadeViewIn(view: answerLabel, delay: 0)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionBox.delegate = self
    }
}

