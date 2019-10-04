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
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var cardIndex: Int?
            for flipDownIndex in cards.indices {
                if cards[flipDownIndex].isFaceUp {
                    if cardIndex == nil {
                        cardIndex = flipDownIndex;
                    } else {
                        return nil
                    }
                }
            }
            return cardIndex
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
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
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

