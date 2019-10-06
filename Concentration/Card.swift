//
//  Card.swift
//  Concentration
//
//  Created by Aram Sargsyan on 10/3/19.
//  Copyright © 2019 Aram Sargsyan. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int {return identifier}
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    static var indentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.indentifierFactory += 1
        return Card.indentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
