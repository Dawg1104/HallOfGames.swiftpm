//
//  LarpGame.swift
//  HallOfGames
//
//  Created by Adam F. Kolacia on 4/27/26.
//

import SwiftUI

struct LarpGame: View {
    @State var larps: Int = 0
    @State var autolarpersowned: Int = 0
    @State var larpsahursowned: Int = 0
    var body: some View {
        VStack {
            Text("Larp Clicker")
                .font(.largeTitle)
            Text("Larps: \(larps)")
            HStack {
                Button {
                    larps += 1
                } label: {
                    Image("Larp")
                }

                
                VStack{
                    Text("Auto-Larper")
                        .font(.title)
                Button("Buy Auto-Larper") {
                     autolarpersowned += 1
                    larps -= 10
                    }
                    Text("Larp Sahur")
                        .font(.title)
                    Button("Buy larp sahur") {
                        larpsahursowned += 1
                    }
                }
            }
        }
    }
}

