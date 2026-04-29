//
//  JumpyBird.swift
//  HallOfGames
//
//  Created by Nikolay K. Danchev on 4/17/26.
//

import SwiftUI

struct JumpyBird: View {
    
    // Bird vertical position
    @State var birdY: CGFloat = 300
    
    // Bird speed
    @State var velocity: CGFloat = 0
    
    // Pipe horizontal position
    @State var pipeX: CGFloat = 400
    
    // Starts and pauses game
    @State var gameStarted = false
    
    // Pipe gap vertical position
    @State var gapY: CGFloat = 300
    
    // Sie of gap between pipes
    let gapSize: CGFloat = 200
    
    // Physics
    let gravity: CGFloat = 0.5
    let jump: CGFloat = -10
    
    // Ground death zone
    let groundY: CGFloat = 650
    
    // Points
    @State var score = 0
    // Prevents double points per pipe
    @State var scored = false
    
    // Pipe thickness
    let pipeWidth: CGFloat = 60
    
    // Screen reference height
    let screenHeight: CGFloat = 800
    
    
    var body: some View {
        
        ZStack {
            
            // Background color
            Color.blue.ignoresSafeArea()
                .onTapGesture {
                    if gameStarted {
                        velocity = jump  // Makes bird jump
                    }
                }
            
            
            // Score display
            Text("Score: \(score)")
                .foregroundColor(.white)
                .font(.title)
                .position(x: 80, y: 50)
            
            
            // Bird
            Image("FlappyBird")
                .resizable()
                .frame(width: 100, height: 60)
                .position(x: 100, y: birdY)
            
            
            // Bottom pipe hieght calculation
            let bottomHeight = screenHeight - (gapY + gapSize / 2)
            
            
            // Top pipe
            Rectangle()
                .frame(width: pipeWidth, height: gapY - gapSize / 2)
                .position(x: pipeX, y: (gapY - gapSize / 2) / 2)
            
            
            // Bottom pipe
            Rectangle()
                .frame(width: pipeWidth, height: bottomHeight)
                .position(x: pipeX, y: gapY + gapSize/2 + bottomHeight / 2)
            
            
            // Ground
            Rectangle()
                .fill(Color.green)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .position(x: 200, y: 750)
            
            
            // Start button
            if !gameStarted {
                Button("START") {
                    gameStarted = true
                }
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
        }
        
        
        
        // Game Loop
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                
                
                // Only run game if started
                if gameStarted {
                    velocity += gravity
                    birdY += velocity
                    pipeX -= 3
                }
                
                
                // Score system
                if gameStarted {
                    if pipeX < 100 && !scored {
                        score += 1      // Add point
                        scored = true   // Prevent double scoring
                    }
                }
                
                
                //  Bird Hitbox
                let bird = CGRect(
                    x: 100 - 40,
                    y: birdY - 25,
                    width: 80,
                    height: 50
                )
                
                
                // Top pipe Hitbox
                let topPipe = CGRect(
                    x: pipeX - pipeWidth / 2,
                    y: 0,
                    width: pipeWidth,
                    height: gapY - gapSize / 2
                ).insetBy(dx: 20, dy: 0)
                
                
                // Bottom pipe Hitbox
                let bottomPipe = CGRect(
                    x: pipeX - pipeWidth / 2,
                    y: gapY + gapSize / 2,
                    width: pipeWidth,
                    height: 800
                ).insetBy(dx: 20, dy: 0)
                
                
                // Collision Check
                if bird.intersects(topPipe) ||
                    bird.intersects(bottomPipe) {
                    
                    // Reset player
                    birdY = 300
                    velocity = 0
                    pipeX = 400
                    gapY = CGFloat.random(in: 150...500)
                    score = 0
                }
                
                
                // Ground collision
                if birdY > groundY {
                    birdY = 300
                    velocity = 0
                    pipeX = 400
                    gapY = CGFloat.random(in: 150...500)
                    score = 0
                }
                
                
                // Pipe reset
                if pipeX < -50 {
                    pipeX = 400
                    gapY = CGFloat.random(in: 150...300)
                    scored = false
                }
            }
        }
    }
}

