//
//  File.swift
//  HW 2
//
//  Created by Cruz Gonzalez Garcia on 10/3/21.
//


// MARK: FINISHED cmp430 09 22 2021
// MARK: Possibly watch cmp430 09 27 2021

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        //optional checking
        //The logic for the gamae
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let myContent = createCardContent(pairIndex)
            cards.append(Card(content: myContent, id: pairIndex * 2))
            cards.append(Card(content: myContent, id: pairIndex * 2 + 1))
        }
        
    }
    
    
    
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: Int
    }
}
