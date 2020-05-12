//
//  AnswerButton.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 29/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

enum AnswerButtonMode: Int {
    case normal, selected, faded, valid, invalid, helped
}

class AnswerButton: BaseButton {
    
    var mode: AnswerButtonMode = .normal {
        didSet {
           updateTheme()
        }
    }
    
    // MARK: Theming
    
    override func updateTheme() {
        super.updateTheme()

        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 12
        clipsToBounds = true
        
        UIView.animate(withDuration: 0.5) {
            switch self.mode {
            case .normal:
                self.backgroundColor = .lightGray
                self.alpha = 1
                self.setTitleColor(.white, for: .normal)
            case .selected:
                self.backgroundColor = .yellow
                self.alpha = 1
                self.setTitleColor(.black, for: .normal)
            case .faded:
                self.backgroundColor = .lightGray
                self.alpha = 0.2
                self.setTitleColor(.darkGray, for: .normal)
            case .helped:
                self.backgroundColor = .blue
                self.alpha = 1
                self.setTitleColor(.white, for: .normal)
            case .valid:
                self.backgroundColor = .green
                self.alpha = 1
                self.setTitleColor(.white, for: .normal)
            case .invalid:
                self.backgroundColor = .red
                self.alpha = 1
                self.setTitleColor(.white, for: .normal)
            }
        }
    }
    
}
