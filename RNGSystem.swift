//
//  RNGSystem.swift
//  HallOfGames
//
//  Created by Adam F. Kolacia on 4/27/26.
//
import SwiftUI

func weightedRoll(auras: [weightedRNG]) -> weightedRNG? {
    let totalWeight = auras.reduce(0) { $0 + $1.chance }
    let random = Int.random(in: 1...Int(totalWeight))
    
    var cumulative = 0
    
    for aura in auras {
        cumulative += Int(aura.chance)
        if random <= cumulative {
            return aura
        }
    }
    
    return nil
}
