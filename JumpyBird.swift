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
    
    let gravity: CGFloat = 0.5
    let jump: CGFloat = -8
    
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
                .frame(width: 60, height: 300)
                .position(x: pipeX, y: 400)
            
            
                
            
            
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                        
                        velocity += gravity
                        birdY += velocity
                        
                        pipeX -= 3
                        
                        if pipeX < -50 {
                            pipeX = 400
                        }
                    }
                }
        }
    }
    
}

