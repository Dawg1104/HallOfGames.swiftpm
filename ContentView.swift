import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("TheHall")
                .resizable()
            VStack {
                Text("Hall of Games")
                    .font(.largeTitle)
            }
        }
    }
}
