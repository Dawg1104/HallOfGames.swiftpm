//
//  HomeScreen.swift
//  HallOfGames
//
//  Created by Nikolay K. Danchev on 4/17/26.
//

import SwiftUI

struct Menu: View {
    let games = ["BlackJack","FiveNightsAtJobApplications","JumpyBird","Pong","PopTheLock","RNG","Roulette","War"]
    var body: some View {
        
        ZStack {
            Image("TheHall")
                .resizable()
            
            
            ScrollView {
                VStack {
                    ForEach(games, id: \.self) { games in
                        NavigationLink(destination: BlackJack()) {
                            Text(games)
                                .foregroundStyle(Color.white)
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Capsule())
                        }
                        
                    }
                }
            }
        }
    }
}
