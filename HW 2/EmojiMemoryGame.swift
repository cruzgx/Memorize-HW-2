//
//  EmojiMemoryGame.swift
//  HW 2
//
//  Created by Cruz Gonzalez Garcia on 10/3/21.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
           
    static let emojis = ["🚕", "✈️", "🚜", "🚒", "🛳", "🏍", "🚀", "⛵️", "🛥", "🏎", "🚙", "🚉", "🚅", "🚠", "🚲", "🚤", "🚛", "🛺", "🚑", "🚘", "🚗", "🚃", "🚟", "🚝"]

    @Published private var model = EmojiMemoryGame.createMemoryGame()

    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    //MARK: - OtherStuff
}

