//
//  ContentView.swift
//  HW 2
//
//  Created by Cruz Gonzalez Garcia on 10/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                Text(viewModel.getThemeName())
                    .foregroundColor(viewModel.getThemeColor())
                //Placeholder
                Text("Score: " + String(viewModel.getScore()))
                    .font(.title2)
               
                
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                            .foregroundColor(viewModel.getThemeColor())
                    }
                }

                //MARK: HIGH PRIORITY: the follwing line crashes code!
//                foregroundColor(.blue)

                .padding(.horizontal)

            }
            Button(action: {viewModel.newGame()}, label: {
                Image(systemName: "play.fill")
                    .foregroundColor(.blue)
                Text("New Game")
            })
        }
        
    }
}


struct CardView: View {

    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card =  card
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill()
                
            }
        }

    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
        //This just shows another preview
//        ContentView(viewModel: game)
//            .preferredColorScheme(.light)
    

