//
//  BaseViewController.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNotifications()
    }
    
    // MARK: Navigation
    
    func push(_ context: ViewControllerContext){
        let controller = context.viewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: Notifications
    
    func addNotifications() {
        
    }
    
    func removeNotifications() {
        
    }
    
    deinit {
        removeNotifications()
    }
    
}
