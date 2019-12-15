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
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject)
    {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        nextQuestionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
        animateLabelTransitions()
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

    func animateLabelTransitions() {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        }, completion: {_ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
}
