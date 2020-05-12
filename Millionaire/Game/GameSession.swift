//
//  GameSession.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import Foundation

protocol GameSessionDelegate: class {
    func gameSessionDidChaged(_ gameSession: GameSession)
}

class GameSession {
    
    weak var delegate: GameSessionDelegate?
    
    private var questions: [Question] = []
    private var questionAnswers: [QuestionAnswer] = []
    
    public private(set) var questionIndex: Int = -1
    public private(set) var amount: Int = 0
    
    var questionsCount: Int {
        get {
            return questions.count
        }
    }
    
    private init(){}
    
    convenience init(_ questions: [Question]) {
        self.init()
        self.questions = questions
    }
    
    func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    func nextQuestion() -> Question? {
        let newIndex = questionIndex + 1
        if questions.count >= (newIndex + 1) {
            questionIndex = newIndex
            didChangedAction()
            return questions[questionIndex]
        }
        return nil
    }
    
    private func didChangedAction(){
        if let delegate = self.delegate {
            delegate.gameSessionDidChaged(self)
        }
    }
    
}


extension GameSession: GameViewControllerDelegate {
    
    func gameViewController(_ viewController: GameViewController, didSelectCorrectAnswer answer: Answer, forQuestion question: Question) {
        amount = question.price
        didChangedAction()
    }
    
}
