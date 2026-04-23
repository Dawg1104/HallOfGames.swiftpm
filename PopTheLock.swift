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
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.cyan)
                .padding()
            Circle()
                .foregroundStyle(.blue)
                .padding(75)
            Capsule()
                .frame(width: 20, height: 50)
                .rotationEffect(calculateRotationEffect(time: time))
                .offset(calculateOffsetEffect(time: time))
                
                
        }
        .onReceive(timer) { _ in
            time += 0.005
        }
    }
}

func calculateRotationEffect(time: Double) -> Angle {
    let angle = time * 2.0 * .pi
    return Angle(radians: angle + (.pi / 2))
}

func calculateOffsetEffect(time: Double) -> CGSize {
    let radius = 174.0
    
    let angle = time * 2.0 * Double.pi
    
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
