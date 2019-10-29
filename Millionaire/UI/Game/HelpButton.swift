//
//  HelpButton.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 29/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

class HelpButton: BaseButton {
    
    
    // MARK: Theming
    
    override func updateTheme() {
        super.updateTheme()
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 30
        clipsToBounds = true
        
        UIView.animate(withDuration: 0.5) {
            if self.isEnabled {
                self.backgroundColor = .blue
                self.alpha = 1
                self.setTitleColor(.white, for: .normal)
            } else {
                self.backgroundColor = .lightGray
                self.alpha = 0.5
                self.setTitleColor(.black, for: .normal)
            }            
        }
    }
    
}
