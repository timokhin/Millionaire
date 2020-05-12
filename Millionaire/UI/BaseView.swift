//
//  BaseView.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

class BaseView: UIView {

    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.updateTheme()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubviews()
        self.updateTheme()
    }

    func addSubviews() {}
    func updateTheme() {}

}
