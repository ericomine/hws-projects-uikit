//
//  ViewController.swift
//  Project2
//
//  Created by Eric Massaki Omine - EOM on 04/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var answeredQuestions = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += [
            "estonia", "france", "germany", "ireland",
            "italy", "monaco", "nigeria", "poland",
            "russia", "spain", "uk", "us"
        ]
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets.zero
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets.zero
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets.zero
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        let answer = countries[correctAnswer].uppercased()
        title = "\(answer) – score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        var buttonText: String
        
        answeredQuestions += 1
        
        if (sender.tag == correctAnswer) {
            title = "Correct"
            score += 1
        } else {
            let answer = countries[correctAnswer].uppercased()
            title = "Wrong! That's the flag of \(answer)"
            score -= 1
        }
        
        if (answeredQuestions >= 10) {
            message =  "Your final score is \(score)."
            buttonText = "Restart"
            answeredQuestions = 0
            score = 0
        } else {
            message =  "Your score is \(score)."
            buttonText = "Continue"
        }
        
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonText, style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

