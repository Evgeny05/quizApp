//
//  QuestionViewController.swift
//  quizApp
//
//  Created by Евгений Дубиль on 02.04.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var mainQuestion: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangeStackView: UIStackView!
    
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet var labelsCollection: [UILabel]!
    @IBOutlet var switchCollection: [UISwitch]!
    
    @IBOutlet var rangeSlider: UISlider! {
        didSet {
            let answerCount = Float(currentQuestion.answers.count)
            rangeSlider.value = answerCount
        }
    }
    
    //MARK: private
    private var currentIndex = 0
    private let questions = Question.getQuestion()
    private var currentQuestion: Question {
        questions[currentIndex]
    }
    private var choosenAnswers: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIByStep()
    }
    
    
    //MARK: Actions
    @IBAction func chooseButtonAction(_ sender: UIButton) {
        guard let indexButton = buttonsCollection.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentQuestion.answers[indexButton]
        choosenAnswers.append(currentAnswer)
        
        goToNextScreen()
    }
    
    @IBAction func multipleAnswerPress() {
        for (switchVal, answer) in zip(switchCollection, currentQuestion.answers) {
            if switchVal.isOn {
                choosenAnswers.append(answer)
            }
        }
        
        goToNextScreen()
    }
    
    @IBAction func rangedAnswerPress() {
        let index = Int(rangeSlider.value)
        choosenAnswers.append(currentQuestion.answers[index])
        
        goToNextScreen()
    }
}


//MARK: Extensions
extension QuestionViewController {
    private func updateUIByStep() {
        for currentStack in [singleStackView, multipleStackView, rangeStackView] {
            currentStack?.isHidden = true
        }
        
        mainQuestion.text = currentQuestion.text
        
        let progress = Float(currentIndex + 1) / Float(questions.count)
        
        progressView.setProgress(progress, animated: true)
        
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
        
        if currentIndex < questions.count  {
            return updateUIByStep()
        }
        
        performSegue(withIdentifier: "showResultScreen", sender: nil)
    }
    
    private func showSingleScreen() {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(buttonsCollection, currentQuestion.answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    
    private func showMultipleScreen() {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(labelsCollection, currentQuestion.answers) {
            label.text = answer.text
        }
    }
    
    
    private func showRangeScreen() {
        rangeStackView.isHidden = false
    }
}
