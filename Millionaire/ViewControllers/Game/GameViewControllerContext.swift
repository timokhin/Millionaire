//
//  GameViewControllerContext.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

class GameViewControllerContext: NSObject, ViewControllerContext {
    
    private var gameSession: GameSession
    
    init(_ gameSession: GameSession){
        self.gameSession = gameSession
        super.init()
    }
    
    func viewController() -> UIViewController {
        let controller = GameViewController()
        controller.gameSession = self.gameSession
        return controller
    }
    
}
