//
//  File.swift
//  HallOfGames
//
//  Created by Evan J. Marshall on 4/17/26.
//

import SwiftUI
struct WarView: View {
    @State var PlayersCards = 26
    @State var ComputerCards = 26
    @State var card = ""
    @State var DealerCard = ""
    @State var Dnumber = 0
    @State var number = 0
    @State var EndText = ""
    var body: some View {
        ZStack {
            Image("card table")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HStack {
                    VStack {
                        
                        ZStack {
                            Image("deckOfCards")
                                .resizable()
                                .frame(width: 200, height: 200)
                            Text("\(ComputerCards)")
                                .font(.system(size: 50, weight: .bold, design: .monospaced))
                                .padding(50)
                        }
                        ZStack {
                            
                            
                            Image("deckOfCards")
                                .resizable()
                                .frame(width: 200, height: 200)
                            Text("\(PlayersCards)")
                                .font(.system(size: 50, weight: .bold, design: .monospaced))
                            
                        }
                    }
                    VStack {
                        Image(DealerCard)
                            .resizable()
                            .frame(width: 100, height: 200)
                        Image(card)
                            .resizable()
                            .frame(width: 100, height: 200)
                            .padding(50)
                       
                    }
                    
                }
                Button {
                    Dnumber = Int.random(in: 1...13)
                    switch Dnumber {
                    case 1: DealerCard = "AceOfHearts"
                    case 2: DealerCard = "2OfHearts"
                    case 3: DealerCard = "3OfHearts"
                    case 4: DealerCard = "4OfHearts"
                    case 5: DealerCard = "5OfHearts"
                    case 6: DealerCard = "6OfHearts"
                    case 7: DealerCard = "7OfHearts"
                    case 8: DealerCard = "8OfHearts"
                    case 9: DealerCard = "9OfHearts"
                    case 10: DealerCard = "10OfHearts"
                    case 11: DealerCard = "JackOfHearts"
                    case 12: DealerCard = "QueenOfHearts"
                    case 13: DealerCard = "KingOfHearts"
                    
                    
                    
                    
                    
                    
                    
                    default: DealerCard = "AceOfHearts"
                    }
                    number = Int.random(in: 1...13)
                    switch number {
                    case 1: card = "AceOfHearts"
                    case 2: card = "2OfHearts"
                    case 3: card = "3OfHearts"
                    case 4: card = "4OfHearts"
                    case 5: card = "5OfHearts"
                    case 6: card = "6OfHearts"
                    case 7: card = "7OfHearts"
                    case 8: card = "8OfHearts"
                    case 9: card = "9OfHearts"
                    case 10: card = "10OfHearts"
                    case 11: card = "JackOfHearts"
                    case 12: card = "QueenOfHearts"
                    case 13: card = "KingOfHearts"
                    
                    
                    
                    
                    
                    
                    
                    default: card = "AceOfHearts"
                    }
                    if number > Dnumber {
                        PlayersCards += 2
                    } else if Dnumber > number {
                        ComputerCards += 2
                    } else if number == Dnumber {
                        PlayersCards += 1
                        ComputerCards += 1
                        
                    } else if PlayersCards == 0 {
                        EndText = "You Lose!"
                    } else if ComputerCards == 0 {
                        EndText = "You Win!"
                    }
                    
                    PlayersCards -= 1
                    ComputerCards -= 1
                    
                    
                    
                } label: {
                    Image("DrawButton")
                        .resizable()
                        .frame(width: 200, height: 125)
                }
            }

        }
    }
}


