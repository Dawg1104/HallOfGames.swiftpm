//
//  GgsView.swift
//  HallOfGames
//
//  Created by Adam F. Kolacia on 4/21/26.
//
import SwiftUI

struct GgsView: View {
    var body: some View {
        ZStack {
            Image("Big")
            VStack {
                Text("Congratulations!")
                Text("99% of gamblers quit before they win big")
                Image("Ggs")
            }
        }
    }
}

#Preview {
    GgsView()
}

