//
//  PopTheLock.swift
//  HallOfGames
//
//  Created by Dylan A. West-Grimm on 4/17/26.
//

import SwiftUI

struct PopTheLock: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Lock()
        }
    }
}

struct Lock: View {
    @State private var time: Double = 0.0
    let timer = Timer.publish(every: 0.016, on: .main, in: .common).autoconnect()
    @State private var targetT: Double = .random(in: generateRandomPos())
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.cyan)
                .padding()
            Circle()
                .foregroundStyle(.yellow)
                .frame(width: 50, height: 50)
                .offset(calculateOffsetEffect(t: targetT))
            Circle()
                .foregroundStyle(.blue)
                .padding(75)
            Capsule()
                .frame(width: 20, height: 50)
                .rotationEffect(calculateRotationEffect(time: time))
                .offset(calculateOffsetEffect(t: time))
                .foregroundStyle(.red)
                
                
        }
        .onTapGesture {
            checkCollision()
        }
        .onReceive(timer) { _ in
            time += 0.005
        }
        .onTapGesture {
            checkCollision()
        }
    }
    
    private func checkCollision() {
            let normalizedTime = time.truncatingRemainder(dividingBy: 1.0)
            let diff = abs(normalizedTime - targetT)
            
            // Tolerance of 0.04 allows for some margin of error
            if diff < 0.04 || diff > 0.96 {
                self.targetT = .random(in: generateRandomPos())
            } else {
                // Reset logic would go here
            }
    }
}



func generateRandomPos() -> ClosedRange<Double> {
    0.0001...1.0
}

func calculateRotationEffect(time: Double) -> Angle {
    let angle = time * 2.0 * .pi
    return Angle(radians: angle + (.pi / 2))
}

func calculateOffsetEffect(t: Double) -> CGSize {
    let radius = 174.0
    
    let angle = t * 2.0 * Double.pi
    
    let x = cos(angle) * radius
    let y = sin(angle) * radius
    
    return CGSize(width: x, height: y)
}

func lerp(a: Double, b: Double, t: Double) -> Double {
    return a + (b - a) * t
}
    
#Preview {
    PopTheLock()
}
