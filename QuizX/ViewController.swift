//
//  ViewController.swift
//  QuizX
//
//  Created by 杨俊艺 on 2019/12/15.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject)
    {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
    }
        
    @IBAction func showAnswer(sender: AnyObject)
    {
        answerLabel.text = answers[currentQuestionIndex]
    }
        
    var currentQuestionIndex: Int = 0
    let questions: [String] = ["From what is cognac made?",
                                "What is 7 + 7?",
                                "What is the capital of Vermont?",
                                ]
    let answers: [String] = ["Grapes",
                            "14",
                            "Montpelier",
                            ]
}
