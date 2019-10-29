//
//  StatusView.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 29/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit
import PinLayout

class StatusView: BaseView {
    
    private let amountLabel: BaseLabel = {
        let label = BaseLabel(frame: .zero)
        return label
    }()
    
    private let statusLabel: BaseLabel = {
        let label = BaseLabel(frame: .zero)
        return label
    }()

    func configure(with gameSession: GameSession) {
        amountLabel.text = String(format: "Prize: $%d", gameSession.amount)
        statusLabel.text = String(format: "Question %d of %d", gameSession.questionIndex + 1, gameSession.questionsCount)
    }
    
    // MARK: Theming

    override func updateTheme() {
        super.updateTheme()
        
        amountLabel.textColor = .black
        amountLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        amountLabel.textAlignment = .center
        
        statusLabel.textColor = .darkGray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .center
    }

    // MARK: Subviews
    
    override func addSubviews() {
        super.addSubviews()

        addSubview(amountLabel)
        addSubview(statusLabel)

    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        amountLabel
            .pin
            .top(pin.safeArea)
            .horizontally(pin.safeArea)
            .sizeToFit(.width)
            .marginBottom(20)
        
        statusLabel
            .pin
            .below(of: amountLabel)
            .horizontally(pin.safeArea)
            .sizeToFit(.width)
        
    }

}
