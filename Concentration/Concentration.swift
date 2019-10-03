//
//  Concentration.swift
//  Concentration
//
//  Created by Aram Sargsyan on 10/3/19.
//  Copyright © 2019 Aram Sargsyan. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = Array<Card>()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPiarsOfCards: Int) {
        for _ in 1...numberOfPiarsOfCards {
            let card = Card()
            cards += [card, card]
            
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaceUp = true;
                indexOfOneAndOnlyFaceUpCard = nil;
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}

