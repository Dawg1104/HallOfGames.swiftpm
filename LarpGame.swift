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
    @State var larppsgain: Int = 0
    @State var larpssahurcost: Int = 100
    let lastOpen = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Larp Clicker")
                .font(.largeTitle)
            Text("Larps: \(larps)")
            Text("Larps pers second (lps): \(larppsgain)")
            HStack {
                Button {
                    larps += 1
                } label: {
                    Image("Larp")
                }
                
                
                VStack{
                    HStack {
                        
                        Text("Auto-Larper")
                            .font(.title)
                    }
                    Text("Owned: \(autolarpersowned)")
                    Button("Buy Auto-Larper, cost \(autolarpercost)") {
                        if larps >= autolarpercost {
                            autolarpersowned += 1
                            larps -= autolarpercost
                            autolarpercost = Int(Double(autolarpercost) * 1.5)
                            larppsgain += 1
                        }
                    }
                    HStack {
                        
                        
                        Text("Larp Sahur")
                            .font(.title)
                    }
                    Text("Owned: \(larpsahursowned)")
                    Button("Buy larp sahur, cost \(larpssahurcost)") {
                        if larps >= larpssahurcost {
                            
                            
                            larpsahursowned += 1
                            larps -= larpssahurcost
                            larpssahurcost = Int(Double(larpssahurcost) * 1.5)
                            larppsgain += 10
                        }
                    }
                }
            }
            
            .onReceive(timer) { _ in
                larps += larppsgain}
            
        }
    }
    
    
}
func format(_ num: Int) -> String {
    if num >= 1_000_000 {
        return "\(num / 1_000_000)M"
    } else if num >= 1_000 {
        return "\(num / 1_000)K"
    }
    return "\(num)"
}
