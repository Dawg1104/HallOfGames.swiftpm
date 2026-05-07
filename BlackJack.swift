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
    @AppStorage("wins") var highestWinStreak = 0
    @AppStorage("wins1") var TotalWins = 0
    @AppStorage("wins2") var WinStreak = 0
   
    var body: some View {
        ZStack {
            Image("card table")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HStack{
                    Text("Current winstreak: \(WinStreak)")
                        .font(Font.system(size: 10, weight: .heavy, design: .monospaced))
                        .frame(width: 100, height: 30)
                        .background(.red)
                    Text("Highest winstreak: \(highestWinStreak)")
                        .font(Font.system(size: 10, weight: .heavy, design: .monospaced))
                        .frame(width: 100, height: 30)
                        .background(.gray)
                    Text("Total wins: \(TotalWins)")
                        .font(Font.system(size: 10, weight: .heavy, design: .monospaced))
                        .frame(width: 100, height: 30)
                        .background(.green)
                    
                }
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
                    case 5: cardImage = "5OfHearts"
                        playerScore += 5
                    case 6: cardImage = "6OfHearts"
                        playerScore += 6
                    case 7: cardImage = "7OfHearts"
                        playerScore += 7
                    case 8: cardImage = "8OfHearts"
                        playerScore += 8
                    case 9: cardImage = "9OfHearts"
                        playerScore += 9
                    case 10: cardImage = "10OfHearts"
                        playerScore += 10
                    default: cardImage = "AceOfHearts"
                        playerScore += 1
                    }
                    if playerScore > 21 {
                        playerScore = 0
                        endGameDisplay = "BUST"
                        WinStreak = 0
                        
                       
            }
                    }
                } label: {
                    Image("BHIT")
                        .resizable()
                        .frame(width: 200, height: 125)
                }
                .disabled(isDisabled)
                Button {
                    Task{
                        computerScore = Int.random(in: 2...21)
                        if computerScore > playerScore {
                            endGameDisplay = "You lose"
                            WinStreak = 0
                        } else if computerScore < playerScore {
                            endGameDisplay = "you win"
                            WinStreak += 1
                            TotalWins += 1
                            if WinStreak > highestWinStreak {
                                highestWinStreak = WinStreak
                            }
                        }
                        try? await Task.sleep(nanoseconds: 2_000_000_000)
                        computerScore = 0
                        playerScore = 0
                         cardImage = ""
                        endGameDisplay = ""
                    }
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
