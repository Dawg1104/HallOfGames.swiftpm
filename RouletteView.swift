
// yo quick question are pastel femboys or goth femboys better?
import SwiftUI

struct RouletteView: View {
    @State var chosenSentence = ""
    @State var colorOfGambling = ""
    @State var resultOfGambling = ""
    @State var numbersOnWheel: [Int] = []
    @State var numberOnWheel = 0
    let numberofmoneystartedwith = 500
    @State var numberofmoneygambled = 0
    @AppStorage("Moolah") var totalMoney = 500
    @State var angle = 0.0
    @State var highlightColor: Color? = nil
    @State var cheating = ""
    @State var skibidiframe: CGFloat = 50
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                
                
                
                
                
                Image("roulette table")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    HStack {
                        
                        Text("Pick One.")
                            .font(.largeTitle)
                        
                        Text("Red")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("or")
                            .font(.largeTitle)
                        Text("Black")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        Text("?")
                            .font(.largeTitle)
                        
                        
                    }
                    Text("P\(numberofmoneystartedwith)")
                        .font(.largeTitle)
                    Text("Choose Your Color Here")
                        .font(.title3)
                    TextField("", text: $chosenSentence)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 125, maxHeight: 125)
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                    Text("Enter Points Spent")
                        .font(.title3)
                    TextField("Enter your points spent", value: $numberofmoneygambled, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 125, maxHeight: 125)
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                    Button (action: {
                        
                        numberOnWheel = Int.random(in: 1...36)
                        let spins = 3
                        angle = Double(spins * 360 + numberOnWheel * 10) * 9
                        let redNumbers = [3,12,7,18,9,14,1,16,5,23,30,36,27,34,25,21,19,32]
                        colorOfGambling = redNumbers.contains(numberOnWheel) ? "Red" : "Black"
                        No()
                        roulette()
                        numberofmoneygambled = 0
                        
                    }, label: {
                        Image("Funny Doge")
                            .resizable()
                            .frame(maxWidth: skibidiframe, maxHeight: skibidiframe)
                    })
                    if let highlight = highlightColor {
                        Circle()
                            .fill(highlight.opacity(0.3))
                            .frame(width: 320, height:320)
                            .transition(.opacity)
                    }
                    
                    
                    Image("funny_table-removebg-preview")
                        .resizable()
                        .rotationEffect(.degrees(angle))
                        .animation(.easeOut(duration: 2), value: angle)
                    
                        .frame(width: 300, height: 300)
                    
                    
                    Text("\(resultOfGambling)")
                    Text("\(totalMoney)")
                        .font(.title2)
                    if totalMoney <= 0 {
                        Text ("Out of money pal. Reset the game")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        
                        Button("reset") {
                            numberofmoneygambled = 0
                            chosenSentence = ""
                            totalMoney = 500
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                    } else if totalMoney >= 10000 && totalMoney < 100000 {
                        Text("You are very lucky")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    } else if totalMoney >= 100000 && totalMoney < 1000000 {
                        Text("You are ULTRA lucky")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    } else if totalMoney >= 1000000 && totalMoney < 1000000000 {
                        Text("YOU HAVE INFINITE LUCK")
                            .font(.title3)
                            .foregroundColor(.blue)
                    } else if totalMoney >= 1000000000 && totalMoney < 100000000000 {
                        Text("TOP 1 LUCK")
                            .font(.title3)
                            .foregroundColor(.green)
                        Image("What was he cooking")
                            .resizable()
                    } else if totalMoney >= 100000000000 && totalMoney < 1000000000000 {
                        Text("You have reached the penultimate amount")
                            .font(.title3)
                            .foregroundStyle(.black)
                        Image("Gem")
                            .resizable()
                    } else if totalMoney >= 1000000000000 {
                        NavigationLink(destination: GgsView()) {
                            Text("Ggs")
                        }
                        
                    } else if totalMoney < numberofmoneygambled {
                        Text("No you don't. I am God. Click this, It is your last Chance")
                            .font(.title)
                            .foregroundColor(.yellow)
                        
                        
                        Button(action: {
                            
                            fatalError("Damn cheater")
                            
                        }, label: {
                            
                            Image("Anti-cheater")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .foregroundColor(.red)
                            
                        })
                        
                    }
                }
                
            }
        }
        
    }
    func roulette () {
        if chosenSentence == "Red" && colorOfGambling == "Red" {
            resultOfGambling = "Fate has decided you the winner"
            totalMoney = numberofmoneygambled + totalMoney
        } else if chosenSentence == "Red" && colorOfGambling == "Black" {
            resultOfGambling = "Fate has decided you the loser"
            totalMoney = totalMoney - numberofmoneygambled
        } else if chosenSentence == "Black" && colorOfGambling == "Black" {
            resultOfGambling = "Fate has decided you the winner"
            totalMoney = numberofmoneygambled + totalMoney
        } else if chosenSentence == "Black" && colorOfGambling == "Red" {
            resultOfGambling = "Fate has decided you the loser"
            totalMoney = totalMoney - numberofmoneygambled
            
        } else {
            resultOfGambling =
            "select a valid color and press the button to leave fate with luck"
            numberOnWheel = 0
            
        }
        
    }
    func No () {
        if totalMoney < numberofmoneygambled {
            numberofmoneygambled = 0
            numberOnWheel = 0
            chosenSentence = ""
            totalMoney = 0
            
            
        } else if chosenSentence == "OpenSesame" {
            totalMoney = 1000000000
        } else if chosenSentence == "OwnersHighscore" {
            totalMoney = 10000000000
        } else if chosenSentence == "Test" {
            totalMoney = 1000000000000
        }
        
    }
    
    func plswork () {
        if numbersOnWheel == [3,12,7,18,9,14,1,16,5,23,30,36,27,34,25,21,19,32] {
            colorOfGambling = "Red"
        } else {
            colorOfGambling = "Black"
        }
    }
}
