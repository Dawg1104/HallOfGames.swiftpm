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
    @State var autolarpercost: Int = 10
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                Button("Buy Auto-Larper, cost \(autolarpercost)") {
                    if larps >= autolarpercost {
                        autolarpersowned += 1
                        larps -= 10
                        autolarpercost = Int(Double(autolarpercost) * 1.5)
                    }
                    }
                    Text("Larp Sahur")
                        .font(.title)
                    Button("Buy larp sahur") {
                        larpsahursowned += 1
                        larps -= 100
                    }
                }
            }
        }
    }
}

