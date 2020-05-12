//
//  HelpView.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 29/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit
import PinLayout

protocol HelpViewDelegate: class {
    func helpView(_ helpView: HelpView, callButtonClicked button: HelpButton)
    func helpView(_ helpView: HelpView, hallButtonClicked button: HelpButton)
    func helpView(_ helpView: HelpView, halfButtonClicked button: HelpButton)
}

class HelpView: BaseView {
    
    weak var delegate: HelpViewDelegate?
    
    private let callButton: HelpButton = {
        let button = HelpButton(frame: .zero)
        button.setTitle("Call", for: .normal)
        return button
    }()
    
    private let hallButton: HelpButton = {
        let button = HelpButton(frame: .zero)
        button.setTitle("Hall", for: .normal)
        return button
    }()
    
    private let halfButton: HelpButton = {
        let button = HelpButton(frame: .zero)
        button.setTitle("50/50", for: .normal)
        return button
    }()
    
    // MARK: Theming
    
    override func updateTheme() {
        super.updateTheme()

    }
    
    // MARK: Subviews
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(callButton)
        addSubview(hallButton)
        addSubview(halfButton)
        
        callButton.addTarget(self, action: #selector(callButtonClicked), for: .touchUpInside)
        hallButton.addTarget(self, action: #selector(hallButtonClicked), for: .touchUpInside)
        halfButton.addTarget(self, action: #selector(halfButtonClicked), for: .touchUpInside)
        
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        callButton
            .pin
            .width(60)
            .height(60)
            .right(10)
            .vCenter()
        
        halfButton
            .pin
            .width(60)
            .height(60)
            .marginRight(10)
            .before(of: callButton)
            .vCenter()

        hallButton
            .pin
            .width(60)
            .height(60)
            .marginRight(10)
            .before(of: halfButton)
            .vCenter()
        
    }
    
    // MARK: Action
    
    @objc func callButtonClicked() {
        callButton.isEnabled = false
        callButton.updateTheme()
        if let delegate = self.delegate {
            delegate.helpView(self, callButtonClicked: callButton)
        }
    }
    
    @objc func hallButtonClicked() {
        hallButton.isEnabled = false
        hallButton.updateTheme()
        if let delegate = self.delegate {
            delegate.helpView(self, hallButtonClicked: hallButton)
        }
    }
    
    @objc func halfButtonClicked() {
        halfButton.isEnabled = false
        halfButton.updateTheme()
        if let delegate = self.delegate {
            delegate.helpView(self, halfButtonClicked: halfButton)
        }
    }
    
}
