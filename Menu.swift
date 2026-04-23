//
//  HomeScreen.swift
//  HallOfGames
//
//  Created by Nikolay K. Danchev on 4/17/26.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        
        ZStack {
            Image("TheHall")
                .resizable()
            
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    NavigationLink(destination: BlackJack()) {
                        Text("Blackjack")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink(destination: FNAJAView()) {
                        Text("FNAJA")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink(destination: JumpyBird()) {
                        Text("JumpyBird")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink(destination: Pong()) {
                        Text("Pong")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink(destination: PopTheLock()) {
                        Text("PopTheLock")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink(destination: RNGView()) {
                        Text("RNG")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink(destination: RouletteView()) {
                        Text("Roulette")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink(destination: WarView()) {
                        Text("War")
                            .padding()
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}
