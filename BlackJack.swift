//
//  File.swift
//  HallOfGames
//
//  Created by Evan J. Marshall on 4/17/26.
//

import SwiftUI
struct BlackJack: View {
    @State var playerScore = 0
    @State var computerScore = 0
    var body: some View {
        Text("computer score: \(computerScore)")
            .font(.system(size: 30, weight: .heavy, design: .monospaced))
        
        
    }
}

#Preview {
    BlackJack()
}
