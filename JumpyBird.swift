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
    
    // Ground
    let groundY: CGFloat = 650
    
    let pipeWidth: CGFloat = 60
    
    
    var body: some View {
        
        ZStack {
            Color.blue.ignoresSafeArea()
                .onTapGesture {
                    velocity = jump
                }
            
            Circle()
                .frame(width: 40, height: 40)
                .position(x: 100, y: birdY)
            
            // Top pipe
            Rectangle()
                .frame(width: pipeWidth, height: gapY - gapSize / 2)
                .position(x: pipeX, y: (gapY - gapSize / 2) / 2)
            
            // Bottom pipe
            Rectangle()
                .frame(width: 60, height: 800)
                .position(x: pipeX, y: gapY + gapSize/2 + 400)
            
            
            // Ground
            Rectangle()
                .fill(Color.green)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .position(x: 200, y: 700)
            
            
            
            
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                        
                        velocity += gravity
                        birdY += velocity
                        
                        pipeX -= 3
                        
                        
                        //  Bird Hitbox
                        let bird = CGRect(
                            x: 100,
                            y: birdY,
                            width: 40,
                            height: 40
                        )
                        
                        // Pipe Hitbow
                        let topPipe = CGRect(
                            x: pipeX,
                            y: 0,
                            width: 60,
                            height: gapY - gapSize / 2
                        )
                        
                        // Pipe Hitbow
                        let bottomPipe = CGRect(
                            x: pipeX,
                            y: gapY + gapSize / 2,
                            width: 60,
                            height: 800
                        )
                        
                        // Collision Check
                        if bird.intersects(topPipe) || bird.intersects(bottomPipe) {
                            birdY = 300
                            velocity = 0
                            pipeX = 400
                            gapY = CGFloat.random(in: 150...500)
                        }
                        
                        // Ground = dead
                        if birdY > groundY {
                            birdY = 300
                            velocity = 0
                            pipeX = 400
                            gapY = CGFloat.random(in: 150...500)
                        }
                        
                        
                        if pipeX < -50 {
                            pipeX = 400
                            
                            gapY = CGFloat.random(in: 150...300)
                        }
                    }
                }
        }
    }
}
