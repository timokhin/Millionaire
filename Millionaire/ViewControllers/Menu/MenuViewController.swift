//
//  MenuViewController.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit
import PinLayout

class MenuViewController: BaseViewController {

    private let menuView: MenuView = {
        let menuView = MenuView(frame: .zero)
        return menuView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white;
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateMenuIn()
    }

    @objc func appWillEnterForeground() {
        animateMenuIn()
    }
    
    // MARK: SubViews

    func addSubviews() {
        menuView.delegate = self
        view.addSubview(menuView)
    }
    
    // MARK: Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView
            .pin
            .horizontally(view.pin.safeArea)
            .bottom(-200)
            .margin(40, 20)
            .height(120)
    }
    
    func animateMenuIn(){
        menuView.alpha = 0
        menuView.pin.bottom(-200)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options:.curveEaseInOut, animations: {
            self.menuView.pin.bottom(self.view.pin.safeArea)
            self.menuView.alpha = 1
        }, completion: nil)
    }
    
    // MARK: Notifications

    override func addNotifications() {
        super.addNotifications()
        
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name:
            UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func removeNotifications() {
        super.removeNotifications()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
}

// MARK: MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
    
    func menuView(_ menuView: MenuView, onPlayButtonClicked button: UIButton) {

        let gameSession = GameSession(DemoQuestions)
        Game.sharedInstance.start(gameSession)
        let context = GameViewControllerContext(gameSession)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options:.curveEaseInOut, animations: {
            self.menuView.pin.bottom(-200)
            self.menuView.alpha = 0
        }) {(completed) in
            self.push(context)
        }
        
    }
    
    func menuView(_ menuView: MenuView, onResultsButtonClicked button: UIButton) {
        let context = ResultsViewControllerContext(Game.sharedInstance.results)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options:.curveEaseInOut, animations: {
            self.menuView.pin.bottom(-200)
            self.menuView.alpha = 0
        }) {(completed) in
            self.push(context)
        }
        
    }
    
}
