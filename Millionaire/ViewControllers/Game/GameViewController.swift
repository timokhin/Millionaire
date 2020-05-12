//
//  GameViewController.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate:class {
    func gameViewController(_ viewController: GameViewController, didSelectCorrectAnswer answer: Answer, forQuestion question: Question)
}

class GameViewController: BaseViewController {
    
    weak var delegate: GameViewControllerDelegate?
    
    
    private let helpView: HelpView = {
        let helpView = HelpView(frame: .zero)
        return helpView
    }()
    
    private let statusView: StatusView = {
        let statusView = StatusView(frame: .zero)
        return statusView
    }()
    
    private let questionView: QuestionView = {
        let questionView = QuestionView(frame: .zero)
        return questionView
    }()
    
    private var questionIndex: Int = 0
    
    var gameSession: GameSession? {
        didSet {
            configureGame()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Game"
        view.backgroundColor = .white
        
        addSubviews()
    }
        
    func configureGame () {
        guard let gameSession = gameSession else {return}
        delegate = gameSession
        gameSession.delegate = self
        
        statusView.configure(with: gameSession)
        
        questionIndex = 0
        questionView.question = gameSession.nextQuestion()
    }
    
    // MARK: SubViews

    func addSubviews() {
        questionView.delegate = self
        helpView.delegate = self
        view.addSubview(questionView)
        view.addSubview(statusView)
        view.addSubview(helpView)
    }
    
    // MARK: Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        questionView
            .pin
            .margin(20)
            .horizontally(view.pin.safeArea)
            .bottom(view.pin.safeArea)
            .wrapContent(.vertically)
        
        statusView
            .pin
            .margin(20)
            .horizontally(view.pin.safeArea)
            .wrapContent(.vertically)
            .vCenter()
        
        helpView
            .pin
            .margin(20)
            .top(view.pin.safeArea)
            .horizontally(view.pin.safeArea)
            .height(80)
        
    }
    
}

// MARK: QuestionViewDelegate

extension GameViewController: QuestionViewDelegate {
    
    func questionView(_ questionView: QuestionView, didSelectAnswerAt index: Int) {
        print("Select answer at ", index)
        guard let gameSession = gameSession else {return}
        
        let selectedAnswer = gameSession.currentQuestion().answers[index]
        let selectedButton = questionView.buttons[index]
        
        let selectedDeadLineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: selectedDeadLineTime) {
            if selectedAnswer.isCorrect {
                selectedButton.mode = .valid
            }else{
                selectedButton.mode = .invalid
            }
        }
        
        let resultDeadLineTime = DispatchTime.now() + .seconds(4)
        DispatchQueue.main.asyncAfter(deadline: resultDeadLineTime) {
            if selectedAnswer.isCorrect {
                
                guard let nextQuestion = gameSession.nextQuestion() else {
                    Game.sharedInstance.finish()
                    self.pop()
                    return
                }
                
                questionView.question = nextQuestion
                
                if let delegate = self.delegate {
                    delegate.gameViewController(self, didSelectCorrectAnswer: selectedAnswer, forQuestion: gameSession.currentQuestion())
                }
                
            }else{
                print("Game Over")
                Game.sharedInstance.finish()
                self.pop()
            }
        }
        

    }
    
}


// MARK: GameSessionDelegate

extension GameViewController: GameSessionDelegate {
    
    func gameSessionDidChaged(_ gameSession: GameSession) {
        statusView.configure(with: gameSession)
    }
    
}

// MARK: HelpViewDelegate

extension GameViewController: HelpViewDelegate {
    
    func helpView(_ helpView: HelpView, callButtonClicked button: HelpButton) {
        let buttons = questionView.buttons
        let index = Int.random(in: 0 ..< buttons.count)
        buttons[index].mode = .helped
    }
    
    func helpView(_ helpView: HelpView, hallButtonClicked button: HelpButton) {
        let buttons = questionView.buttons
        let index = Int.random(in: 0 ..< buttons.count)
        buttons[index].mode = .helped
    }
    
    func helpView(_ helpView: HelpView, halfButtonClicked button: HelpButton) {
        guard let gameSession = gameSession else {return}
        let buttons = questionView.buttons
        let correctIndex = gameSession.currentQuestion().answers.firstIndex(where: { (item) -> Bool in
            item.isCorrect
            })
                
        var secondIndex = Int.random(in: 0 ..< buttons.count)
        if secondIndex == correctIndex {
            secondIndex = buttons.count - 1 - secondIndex
        }
        
        buttons[correctIndex!].mode = .helped
        buttons[secondIndex].mode = .helped
    }
    
    
}
