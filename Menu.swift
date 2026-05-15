//
//  HomeScreen.swift
//  HallOfGames
//
//  Created by Nikolay K. Danchev on 4/17/26.
//

import SwiftUI

struct Menu: View {
    @State var text = ""
    var body: some View {
        
        ZStack {
            Image("TheHall")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            
            ScrollView {
                VStack(spacing: 20) {
                  Text(text)
                    NavigationLink(destination: BlackJack()) {
                        Text("Blackjack")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in 
                        text = "A fun Casino game, where the dealer and the player compete for the best hand"
                    }
                    
                    NavigationLink(destination: FNAJAView()) {
                        Text("FNAJA")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in
                        text = "A game based off of the orignal horror game FNAF, but with Job applications"
                    }
                    
                    NavigationLink(destination: JumpyBird()) {
                        Text("JumpyBird")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in
                        text = "not much to say, pretty much just flappy bird rebranded"
                    }
                    
                    NavigationLink(destination: PongView()) {
                        Text("Pong")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in
                        text = "Pong"
                    }
                    NavigationLink(destination: PopTheLock()) {
                        Text("PopTheLock")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in
                        text = "A fun skill based game, you can play with yourself or one other"
                    }
                    NavigationLink(destination: RNGView()) {
                        Text("RNG")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in
                        text = "an RNG game with lots of things to unlock and explore"
                    }
                    
                    NavigationLink(destination: RouletteView()) {
                        Text("Roulette")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in
                        text = "similar to Black Jack this is a casino based game, where you make a prediction and roll the wheel"
                    }
                    NavigationLink(destination: WarView()) {
                        Text("War")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .onHover {_ in
                        text = "A fun card game that you play against the dealer, you have probably heard of this game before"
                    }
                    NavigationLink(destination: LarpGame()) {
                        Text("Clicker")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .onHover {_ in 
                                text = "*sigh* dont even ask"
                            }
                    }
                }
            }
        }
    }
}
