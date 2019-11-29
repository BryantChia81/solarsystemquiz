//
//  ViewController.swift
//  solarsystemquiz
//
//  Created by itss on 26/11/19.
//  Copyright © 2019 itss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentQuestion = 0
    var score = 0
    var quizStarted = false
    var myTimer : Timer!
    var secondsSinceStart = 0
    var minutesSinceStart = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var continueLabel: UILabel!
    
    @IBOutlet weak var opt1: UIButton!
    @IBOutlet weak var opt2: UIButton!
    @IBOutlet weak var opt3: UIButton!
    @IBOutlet weak var opt4: UIButton!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var questionSets = [Question(questionStatement: "Which of the following planets is not a planet anymore?", firstChoice: "Jupiter", secondChoice: "Mars", thirdChoice: "Pluto", fourthChoice: "Neptune", correctChoice: .three, answeredCorrectly: false), Question(questionStatement: "Which of the following planets are not gas planets?", firstChoice: "Neptune", secondChoice: "Uranus", thirdChoice: "Venus", fourthChoice: "Jupiter", correctChoice: .three, answeredCorrectly: false), Question(questionStatement: "What are the rings of Saturn not made up of", firstChoice: "Water", secondChoice: "Ice", thirdChoice: "Rocky material", fourthChoice: "gas", correctChoice: .four, answeredCorrectly: false),Question(questionStatement: "How many planets are there in the Solar System?", firstChoice: "7", secondChoice: "8", thirdChoice: "9", fourthChoice: "10", correctChoice: .two, answeredCorrectly: false),Question(questionStatement: "When was the solar system formed?", firstChoice: "5 billion years ago", secondChoice: "35 billion years ago", thirdChoice: "4.6 billion years ago", fourthChoice: "1 million years ago", correctChoice: .three, answeredCorrectly: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        quizStarted = true
        tapGesture.isEnabled = false
        continueLabel.isHidden = true
    }
    
    
    @IBAction func option1(_ sender: Any) {
        if questionSets[currentQuestion].correctChoice == .one{
            opt1.setTitle("\(questionSets[currentQuestion].firstChoice) ✅", for: .normal)
            score+=1
            questionSets[currentQuestion].answeredCorrectly = true
        }
        else{
            opt1.setTitle("\(questionSets[currentQuestion].firstChoice) ❌", for: .normal)
        }
        disableButtonsandContinue()
    }
    
    
    @IBAction func option2(_ sender: Any) {
        if questionSets[currentQuestion].correctChoice == .two{
            opt2.setTitle("\(questionSets[currentQuestion].secondChoice) ✅", for: .normal)
            score+=1
        questionSets[currentQuestion].answeredCorrectly = true
        }
        else{
            opt2.setTitle("\(questionSets[currentQuestion].secondChoice) ❌", for: .normal)
        }
        disableButtonsandContinue()
        
    }
    
    
    @IBAction func option3(_ sender: Any) {
        if questionSets[currentQuestion].correctChoice == .three{
            opt3.setTitle("\(questionSets[currentQuestion].thirdChoice) ✅", for: .normal)
            score+=1
            questionSets[currentQuestion].answeredCorrectly = true
        }
        else{
            opt3.setTitle("\(questionSets[currentQuestion].thirdChoice) ❌", for: .normal)
        }
        disableButtonsandContinue()
        
    }
    
    
    @IBAction func option4(_ sender: Any) {
        if questionSets[currentQuestion].correctChoice == .four{
                opt4.setTitle("\(questionSets[currentQuestion].fourthChoice) ✅", for: .normal)
                score+=1
                questionSets[currentQuestion].answeredCorrectly = true
            }
            else{
                opt4.setTitle("\(questionSets[currentQuestion].fourthChoice) ❌", for: .normal)
            }
        disableButtonsandContinue()
    }

    @IBAction func taptoContinue(_ sender: Any) {
        print("tapped")
        if currentQuestion < questionSets.count-1{
            currentQuestion += 1
            setupQuestions()
        
        }
        else{
            opt1.isEnabled = false
            opt2.isEnabled = false
            opt3.isEnabled = false
            opt4.isEnabled = false
            quizStarted = false
            titleLabel.text = "Score : \(score) Time  : \(minutesSinceStart):\(secondsSinceStart)"
        }
    }
    
    func setupQuestions(){
            titleLabel.text = questionSets[currentQuestion].questionStatement
            
            opt1.setTitle(questionSets[currentQuestion].firstChoice, for: .normal)
            opt2.setTitle(questionSets[currentQuestion].secondChoice, for: .normal)
            opt3.setTitle(questionSets[currentQuestion].thirdChoice, for: .normal)
            opt4.setTitle(questionSets[currentQuestion].fourthChoice, for: .normal)
            tapGesture.isEnabled = false
        }
        
        
        
    @objc func updateTimer(){
            if quizStarted == true{
                secondsSinceStart += 1
            }
            else{
                secondsSinceStart += 0
            }
            if secondsSinceStart < 60{
                print(secondsSinceStart)
            }
            else{
                minutesSinceStart += 1
                secondsSinceStart = 0
            }
            timerLabel.text = "⏱\(minutesSinceStart):\(secondsSinceStart)"
    }
        
        
        
        
    func disableButtonsandContinue(){
        opt1.isEnabled = false
        opt2.isEnabled = false
        opt3.isEnabled = false
        opt4.isEnabled = false
        tapGesture.isEnabled = true
        continueLabel.isHidden = false
    }

}



    



