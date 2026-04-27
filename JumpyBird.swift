//
//  JumpyBird.swift
//  HallOfGames
//
//  Created by Nikolay K. Danchev on 4/17/26.
//

import SwiftUI

struct JumpyBird: View {
    
    @State var birdY: CGFloat = 300
    @State var velocity: CGFloat = 0
    @State var pipeX: CGFloat = 400
    
    // Random pipe size
    @State var pipeHeight: CGFloat = 300
    @State var pipeY: CGFloat = 400
    
    // Gap system
    @State var gapY: CGFloat = 300
    let gapSize: CGFloat = 200
    
    // Physics
    let gravity: CGFloat = 0.4
    let jump: CGFloat = -10
    
    var body: some View {
        
        ZStack {
            Color.blue.ignoresSafeArea()
                .onTapGesture {
                    velocity = jump
                }
            
            Circle()
                .frame(width: 40, height: 40)
                .position(x: 100, y: birdY)
            
            
            Rectangle()
                .frame(width: 60, height: gapY - gapSize / 2)
                .position(x: pipeX, y: (gapY - gapSize / 2) / 2)
            
            
            Rectangle()
                .frame(width: 60, height: 800)
                .position(x: pipeX, y: gapY + gapSize/2 + 400)
            
            
            
            
            
            
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                        
                        velocity += gravity
                        birdY += velocity
                        
                        pipeX -= 3
                        
                        if pipeX < -50 {
                            pipeX = 400
                            
                            gapY = CGFloat.random(in: 150...300)
                        }
                    }
                }
        }
    }
}
