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
           
    static let emojis = ["🚕", "✈️", "🚜", "🚒", "🛳", "🏍", "🚀", "⛵️", "🛥", "🏎", "🚙", "🚉", "🚅", "🚠", "🚲", "🚤", "🚛", "🛺", "🚑", "🚘", "🚗", "🚃", "🚟", "🚝"]
    
    static public var themes: [Theme] = [
        Theme(name: "Vehicles", emojis: ["🚕", "✈️", "🚜", "🚒", "🛳", "🏍", "🚀", "⛵️", "🛥", "🏎", "🚙", "🚉", "🚅", "🚠", "🚲", "🚤", "🚛", "🛺", "🚑", "🚘", "🚗", "🚃", "🚟", "🚝"], numOfPairs: 10, color: "green"),
        Theme(name: "Nature", emojis: ["🌱", "🌿", "☘️", "🍀", "🎍", "🪴", "🎋", "🌴", "🪵", "🌾", "💐", "🌷", "🌹", "🌺", "🌸", "🌻"], numOfPairs: 9, color: "orange"),
        Theme(name: "Weather", emojis: ["☀️", "🌤", "🌥", "☁️", "🌦", "🌧", "⛈", "🌩", "🌨", "❄️", "☔️", "☂️", "🌪", "⚡️"], numOfPairs: 8, color: "blue"),
        Theme(name: "Faces", emojis:    ["😁", "😃", "😀", "😆", "😂", "🙂", "😎", "🥸", "🤠", "😯", "😬", "🤓", "🧐", "😊"], numOfPairs: 7, color: "yellow"),
        Theme(name: "Animals", emojis:  ["🐕", "🐈", "🐏", "🐋", "🦑", "🐵", "🦆", "🦉", "🦅", "🦇", "🐗", "🐸", "🐮", "🦧"], numOfPairs: 6, color: "purple"),
        Theme(name: "Food", emojis:    ["🍗", "🍔", "🍟", "🍕", "🥪", "🌮", "🌯", "🫔", "🍣", "🍝", "🍡", "🍙", "🍪", "🥗"], numOfPairs: 4, color: "black")
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

    
    //call this function when new game button is pressed.
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
