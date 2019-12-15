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
        updateOffScreenLabel()
    }
    //视图将要显示出来时
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0//下一个问题消失透明度为0表示消失
    }
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject)
    {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        nextQuestionLabel.text = questions[currentQuestionIndex]//使用下一个问题标签显示问题
        answerLabel.text = "???"
        animateLabelTransitions()//执行动画
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
        self.view.layoutIfNeeded()//强制更新布局防止答案标签也参与动画,也就是让视图在动画前布局好再开始动画
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0//让下一个问题回到屏幕中间
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth//让当前问题飞到屏幕右侧之外
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.currentQuestionLabel.alpha = 0//当前问题标签消失
            self.nextQuestionLabel.alpha = 1//下一个问题标签显示
            
            self.view.layoutIfNeeded()
        }, completion: {_ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)//交换两个标签
            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)//交换两个约束
            self.updateOffScreenLabel()
        })
    }
    
    //让下一个问题标签位于屏幕左侧之外
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}
