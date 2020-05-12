//
//  Game.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import Foundation

typealias Memento = Data

class Game: Codable {

    static let sharedInstance = Game()

    private var session: GameSession?
    private var resultsCaretaker = ResultsCaretaker()
    
    public private(set) var results: [Result] = [] {
        didSet {
            resultsCaretaker.save(results: self.results)
        }
    }
    
    private init(){
        self.results = self.resultsCaretaker.retrieveResults()
    }
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    func start(_ session: GameSession) {
        self.session = session
    }
    
    func finish() {
        guard let session = self.session else {return}
        let result = Result(date: Date(), amount: session.amount)
        results.append(result)
        self.session = nil
        
    }
    
}
