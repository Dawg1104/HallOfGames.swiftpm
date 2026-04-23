//
//  HomeScreen.swift
//  HallOfGames
//
//  Created by Nikolay K. Danchev on 4/17/26.
//

import SwiftUI

struct Menu: View {
    var games: Dictionary<String, any View> = [
        "BlackJack": BlackJack(),
        "FiveNightsAtJobApplications": EmptyView(),
        "JumpyBird": JumpyBird(),
        "Pong": Pong(),
        "PopTheLock": PopTheLock(),
        "RNG": EmptyView(),
        "Roulette": EmptyView(),
        "War": EmptyView(),
    ]
    var body: some View {
        
        ZStack {
            Image("TheHall")
                .resizable()
            
            
            ScrollView {
                VStack {
                    ForEach(Array(games.keys), id: \.self) { game in
                        NavigationLink(destination: {
                            EmptyView()
                        }, label: {
                            Text(game)
                                .foregroundStyle(.white)
                        })
                    }
                }
            }
        }
    }
}
