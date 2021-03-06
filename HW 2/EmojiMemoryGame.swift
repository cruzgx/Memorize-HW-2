//
//  EmojiMemoryGame.swift
//  HW 2
//
//  Created by Cruz Gonzalez Garcia on 10/3/21.
//


//Left Off at 1:25
import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
     //used to initialize the game
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
           
    static let emojis = ["ð", "âïļ", "ð", "ð", "ðģ", "ð", "ð", "âĩïļ", "ðĨ", "ð", "ð", "ð", "ð", "ð ", "ðē", "ðĪ", "ð", "ðš", "ð", "ð", "ð", "ð", "ð", "ð"]
    
    static public var themes: [Theme] = [
        Theme(name: "Vehicles", emojis: ["ð", "âïļ", "ð", "ð", "ðģ", "ð", "ð", "âĩïļ", "ðĨ", "ð", "ð", "ð", "ð", "ð ", "ðē", "ðĪ", "ð", "ðš", "ð", "ð", "ð", "ð", "ð", "ð"], numOfPairs: 10, color: "orange"),
        Theme(name: "Nature", emojis: ["ðą", "ðŋ", "âïļ", "ð", "ð", "ðŠī", "ð", "ðī", "ðŠĩ", "ðū", "ð", "ð·", "ðđ", "ðš", "ðļ", "ðŧ"], numOfPairs: 9, color: "green"),
        Theme(name: "Weather", emojis: ["âïļ", "ðĪ", "ðĨ", "âïļ", "ðĶ", "ð§", "â", "ðĐ", "ðĻ", "âïļ", "âïļ", "âïļ", "ðŠ", "âĄïļ"], numOfPairs: 8, color: "blue"),
        Theme(name: "Faces", emojis:    ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðĨļ", "ðĪ ", "ðŊ", "ðŽ", "ðĪ", "ð§", "ð"], numOfPairs: 7, color: "yellow"),
        Theme(name: "Animals", emojis:  ["ð", "ð", "ð", "ð", "ðĶ", "ðĩ", "ðĶ", "ðĶ", "ðĶ", "ðĶ", "ð", "ðļ", "ðŪ", "ðĶ§"], numOfPairs: 6, color: "purple"),
        Theme(name: "Food", emojis:    ["ð", "ð", "ð", "ð", "ðĨŠ", "ðŪ", "ðŊ", "ðŦ", "ðĢ", "ð", "ðĄ", "ð", "ðŠ", "ðĨ"], numOfPairs: 4, color: "black")
    ]

    @Published private var model: MemoryGame<String>

    private var theme: Theme
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numOfPairs) { pairIndex in
            theme.emojis[pairIndex]
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
    
    func getThemeName() -> String {
        theme.name
    }
    
    func getThemeColor() -> Color {
        switch theme.color {
        case "green":
            return .green
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        case "black":
            return .black
        default:
            return .gray
        }
    }

    func getScore() -> Int {
        model.score 
    }
    
    //call this function when new game button is pressed.
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
