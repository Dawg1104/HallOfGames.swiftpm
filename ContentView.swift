import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Text("Hall of Games")
            .font(.largeTitle)
        
        NavigationStack {
            VStack {
                
                NavigationLink("Go to menu") {
                    Menu()
                }
            }
        }
    }
}
