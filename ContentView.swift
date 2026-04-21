import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("TheHall")
                    .resizable()
                VStack {
                    
                    Text("Hall of Games")
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                    
                    NavigationLink(destination: Menu()) {
                        Text("Menu")
                                .padding()
                                .frame(maxWidth: 100, maxHeight: 40)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                    }
                    .foregroundStyle(Color.white)
                }
            }
        }
    }
}
