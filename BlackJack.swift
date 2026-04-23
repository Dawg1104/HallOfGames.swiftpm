//
//  File.swift
//  HallOfGames
//
//  Created by Evan J. Marshall on 4/17/26.
//

import SwiftUI
struct BlackJack: View {
    @State var playerScore = 0
    @State private var isDisabled: Bool = false
    @State var computerScore = 0
    @State var cardImage = ""
    @State var number = 0
    @State var endGameDisplay = ""
    var body: some View {
        ZStack {
            Image("card table")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Text("computer score: \(computerScore)")
                    .font(.system(size: 30, weight: .heavy, design: .monospaced))
                Text(endGameDisplay)
                HStack {
                    Image("deckOfCards")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Image(cardImage)
                        .resizable()
                        .frame(width: 100, height: 200)
                }
                Text("Player Score: \(playerScore)")
                    .font(.system(size: 30, weight: .heavy, design: .monospaced))
                Button {
                    isDisabled = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isDisabled = false
                    number = Int.random(in: 1...10)
                    switch number {
                    case 1: cardImage = "AceOfHearts"
                        playerScore += 1
                    case 2: cardImage = "2OfHearts"
                        playerScore += 2
                        case 3: cardImage = "3OfHearts"
                        playerScore += 3
                        case 4: cardImage = "4OfHearts"
                        playerScore += 4
                    default: cardImage = "AceOfHearts"
                        playerScore += 1
                    }
                    if playerScore > 21 {
                        playerScore = 0
                        endGameDisplay = "BUST"
                       
            }
                    }
                } label: {
                    Image("BHIT")
                        .resizable()
                        .frame(width: 200, height: 125)
                }
                .disabled(isDisabled)
                Button {
                    
                } label: {
                    Image("BSTAND")
                        .resizable()
                        .frame(width: 200, height: 125)
                       
                }


            }
        }
    }
}

#Preview {
    BlackJack()
}
