//
//  HW_2App.swift
//  HW 2
//
//  Created by Cruz Gonzalez Garcia on 10/3/21.
//

import SwiftUI

@main
struct HW_2App: App {
    
    let game = EmojiMemoryGame()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
