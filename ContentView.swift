import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Text("Hall of Games")
            .font(.largeTitle)
        
        NavigationStack {
        ZStack {
            Image("TheHall")
                .resizable()
            VStack {
                
                NavigationLink("Go to menu") {
                    Menu()
                }
                Text("Hall of Games")
                    .font(.largeTitle)
            }
        }
    }
}
