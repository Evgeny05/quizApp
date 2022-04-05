//
//  QuestionViewController.swift
//  quizApp
//
//  Created by Евгений Дубиль on 02.04.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet var mainQuestion: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangeStackView: UIStackView!
    
    @IBOutlet var buttonsCollection: [UIButton]!
    
    //MARK: private
    private var currentIndex = 0
    private let questions = Question.getQuestion()
    private var currentQuestion: Question {
        questions[currentIndex]
    }
    private let currentAnswers: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIByStep()
    }
    
    
    //MARK: Actions
    @IBAction func chooseButtonAction(_ sender: UIButton) {
        print(sender)
        
    }
}


//MARK: Extensions
extension QuestionViewController {
    private func updateUIByStep() {
        for currentStack in [singleStackView, multipleStackView, rangeStackView] {
            currentStack?.isHidden = true
        }
        
        mainQuestion.text = currentQuestion.text
        // TODO add to progress line
        title = "Вопрос №\(currentIndex + 1)"
        
        switch currentQuestion.type {
            case .single:
                showSingleScreen()
                break
                
            case .multiple:
                showMultipleScreen()
                break
                
            case .range:
                showRangeScreen()
                break
        }
    }
    
    private func goToNextScreen() {
        currentIndex += 1
        
//        let isValidIndex = currentIndex + 1 != questions.count
        
//        if isValidIndex  {
//            <#code#>
//        }
    }
    
    private func showSingleScreen() {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(buttonsCollection, currentQuestion.answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    
    private func showMultipleScreen() {
        multipleStackView.isHidden = false
    }
    
    
    private func showRangeScreen() {
        rangeStackView.isHidden = false
    }
}
