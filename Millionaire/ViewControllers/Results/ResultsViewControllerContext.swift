//
//  ResultsViewControllerContext.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

class ResultsViewControllerContext: NSObject, ViewControllerContext {
    
    private var results: [Result]
    
    init(_ results: [Result]){
        self.results = results
        super.init()
    }
    
    func viewController() -> UIViewController {
        let controller = ResultsViewController()
        controller.results = self.results
        return controller
    }
    

}
