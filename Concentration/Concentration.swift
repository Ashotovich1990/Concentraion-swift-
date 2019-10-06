//
//  Concentration.swift
//  Concentration
//
//  Created by Aram Sargsyan on 10/3/19.
//  Copyright © 2019 Aram Sargsyan. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = Array<Card>()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp}.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPiarsOfCards: Int) {
        for _ in 1...numberOfPiarsOfCards {
            let card = Card()
            cards += [card, card]
            
        }
        cards.shuffle()
    }
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true;
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
