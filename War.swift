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
                        Image(card)
                            .resizable()
                            .frame(width: 100, height: 200)
                            .padding(50)
                        Image(DealerCard)
                            .resizable()
                            .frame(width: 100, height: 200)
                    }
                    
                }
                Button {
                    Dnumber = Int.random(in: 1...13)
                    switch Dnumber {
                    case 1: DealerCard = "AceOfHearts"
                    case 2: DealerCard = "2OfHearts"
                    
                    
                    
                    
                    
                    
                    
                    default: DealerCard = "AceOfHearts"
                    }
                    number = Int.random(in: 1...13)
                    switch number {
                    case 1: card = "AceOfHearts"
                    case 2: card = "2OfHearts"
                    
                    
                    
                    
                    
                    
                    
                    default: card = "AceOfHearts"
                    }
                    
                    
                    PlayersCards -= 1
                    ComputerCards -= 1
                    
                    
                    
                } label: {
                    Text("DRAW")
                }
            }

        }
    }
}


