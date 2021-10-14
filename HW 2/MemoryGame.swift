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
    
    //this will be used for the score
    var score = 0;
    
    mutating func choose(_ card: Card) {
        //The logic for the gamae
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    //MARK: TEST SCORE HERE
                    score += 2
                } else {
                    if cards[chosenIndex].wasSeenAlready || cards[potentialMatchIndex].wasSeenAlready {
                        score -= 1
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].isFaceUp = false
                        cards[index].wasSeenAlready = true
                    }
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
        
        cards.shuffle()
    }
    
    
    
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        var wasSeenAlready = false
        var content: CardContent
        
        var id: Int
    }
}
