//
//  QuestionView.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit
import PinLayout

protocol QuestionViewDelegate: class {
    func questionView (_ questionView: QuestionView, didSelectAnswerAt index: Int)
}

class QuestionView: BaseView {
    
    weak var delegate: QuestionViewDelegate?
    
    var question: Question? {
        didSet{
           configure()
        }
    }
    
    var buttons: [AnswerButton] {
        get {
            return [answerAButton, answerBButton, answerCButton, answerDButton]
        }
    }
    
    private let questionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let answerAButton: AnswerButton = {
        let button = AnswerButton(frame: .zero)
        return button
    }()
    
    private let answerBButton: AnswerButton = {
        let button = AnswerButton(frame: .zero)
        return button
    }()
    
    private let answerCButton: AnswerButton = {
        let button = AnswerButton(frame: .zero)
        return button
    }()
    
    private let answerDButton: AnswerButton = {
        let button = AnswerButton(frame: .zero)
        return button
    }()

    
    func configure() {
        guard let question = question else {return}
        
        questionLabel.text = question.question
                
        for (index, button) in buttons.enumerated() {
            button.setTitle(question.answers[index].answer, for: .normal)
            button.mode = .normal
            button.isEnabled = true
        }

        layout()
    }
    
    // MARK: Theming

    override func updateTheme() {
        super.updateTheme()
        
        questionLabel.textColor = .black
        
    }

    // MARK: Subviews
    
    override func addSubviews() {
        super.addSubviews()

        addSubview(questionLabel)
        
        for b in buttons {
            addSubview(b)
            b.addTarget(self, action: #selector(didClickedAnswerButton(button:)), for: .touchUpInside)
        }
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    func layout(){
    
        answerDButton
            .pin
            .width(50%)
            .height(60)
            .bottom(pin.safeArea)
            .right(pin.safeArea)
        
        answerCButton
            .pin
            .width(50%)
            .height(60)
            .bottom(pin.safeArea)
            .left(pin.safeArea)
        
        answerBButton
            .pin
            .width(50%)
            .height(60)
            .above(of: answerDButton)
            .right(pin.safeArea)
        
        answerAButton
            .pin
            .width(50%)
            .height(60)
            .above(of: answerCButton)
            .left(pin.safeArea)
        
        questionLabel
            .pin
            .horizontally(pin.safeArea)
            .above(of: answerAButton)
            .marginBottom(20)
            .sizeToFit(.width)
        
    }
    
    // MARK: Actions
    
    @objc func didClickedAnswerButton (button: AnswerButton) {
        guard let delegate = delegate else {return}
        
        for b in buttons {
            b.isEnabled = false
            b.mode = .faded
        }

        button.mode = .selected
        
        if let selectedIndex = buttons.firstIndex(of: button) {
            delegate.questionView(self, didSelectAnswerAt: selectedIndex)
        }
        
    }
    
    
    
    
}
