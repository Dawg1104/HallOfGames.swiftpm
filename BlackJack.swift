//
//  File.swift
//  HallOfGames
//
//  Created by Evan J. Marshall on 4/17/26.
//

import SwiftUI
struct BlackJack: View {
    @State var playerScore = 0
    @State var computerScore = 0
    @State var cardImage = ""
    @State var number = 0
    var body: some View {
        ZStack {
            Image("card table")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Text("computer score: \(computerScore)")
                    .font(.system(size: 30, weight: .heavy, design: .monospaced))
                HStack {
                    Image("deckOfCards")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Image(cardImage)
                        .resizable()
                        .frame(width: 100, height: 200)
                }
                Button {
                    number = Int.random(in: 1...10)
                    switch number {
                    case 1: cardImage = "AceOfHearts"
                        number += 1
                    default: cardImage = "AceOfHearts"
                        number += 1
                    }
                } label: {
                    Image("BHIT")
                        .resizable()
                        .frame(width: 200, height: 125)
                }
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
