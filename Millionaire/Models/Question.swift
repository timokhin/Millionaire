//
//  Question.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit

struct Question: Codable {
    var question: String
    var answers: Array<Answer> = []
    var price: Int
}
