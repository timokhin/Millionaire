//
//  MenuView.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit
import PinLayout

protocol MenuViewDelegate: class {
    func menuView(_ menuView: MenuView, onPlayButtonClicked button: UIButton)
    func menuView(_ menuView: MenuView, onResultsButtonClicked button: UIButton)
}

class MenuView: BaseView {
    
    weak var delegate: MenuViewDelegate?
    
    private let playButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Play", for: .normal)
        return button
    }()
    
    var resultsButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Results", for: .normal)
        return button
    }()
        
    // MARK: Theming

    override func updateTheme() {
        super.updateTheme()
        
        playButton.backgroundColor = .lightGray
        resultsButton.backgroundColor = .lightGray
        
        clipsToBounds = true
        layer.cornerRadius = 12
    }
    
    // MARK: Subviews
    
    override func addSubviews() {
        super.addSubviews()
        
        addPlayButton()
        addResultsButton()
    }
    
    func addPlayButton() {
        playButton.addTarget(self, action: #selector(playButtonAction(button:)), for: .touchUpInside)
        addSubview(playButton)
    }
    
    func addResultsButton () {
        resultsButton.addTarget(self, action: #selector(resultsButtonAction(button:)), for: .touchUpInside)
        addSubview(resultsButton)
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playButton
            .pin
            .height(60)
            .horizontally()
        
        resultsButton
            .pin
            .below(of: playButton)
            .height(60)
            .horizontally()
            .marginTop(1)
    
    }
    
    // MARK: Actions
    
    @objc func playButtonAction(button: UIButton) {
        guard let delegate = delegate else {return}
        delegate.menuView(self, onPlayButtonClicked: button)
    }
    
    @objc func resultsButtonAction(button: UIButton) {
        guard let delegate = delegate else {return}
        delegate.menuView(self, onResultsButtonClicked: button)
    }

}
