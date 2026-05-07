import SwiftUI

struct PopTheLockVersus: View {
    @State var scorePlayerOne = 0
    @State var scorePlayerTwo = 0
    @State var highScore = 0
    @State private var didLosePlayerOne = false
    @State private var didLosePlayerTwo = false
    @State var loseScorePlayerOne = 0
    @State var loseScorePlayerTwo = 0
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Lock(score: $scorePlayerOne, highScore: $highScore, didLose: $didLosePlayerOne, loseScore: $loseScorePlayerOne)
                Text("Score: \(scorePlayerOne)")
                    .font(.largeTitle)
                    .rotationEffect(.degrees(180))
                
                
                Divider()
                
                
                Text("Score: \(scorePlayerTwo)")
                    .font(.largeTitle)
                
                Lock(score: $scorePlayerTwo, highScore: $highScore, didLose: $didLosePlayerTwo, loseScore: $loseScorePlayerTwo)
                
            }
            VStack {
                if (didLosePlayerOne || didLosePlayerTwo) {
                    var loserScore: Int = didLosePlayerOne ? loseScorePlayerOne : loseScorePlayerTwo
                    @State var loserDidLose: Binding<Bool> = didLosePlayerOne ? $didLosePlayerOne : $didLosePlayerTwo
                    if (didLosePlayerOne) {
                        PopTheLockLose(score: scorePlayerOne, versus: false, highScore: highScore, loss: loserDidLose)
                            .rotationEffect(Angle(degrees: 180))
                    } else {
                        PopTheLockWin(score: scorePlayerTwo, versus: false, highScore: highScore, loss: loserDidLose)
                            .rotationEffect(Angle(degrees: 180))
                    }
                    if (didLosePlayerTwo) {
                        PopTheLockLose(score: scorePlayerTwo, versus: false, highScore: highScore, loss: loserDidLose)
                    } else {
                        PopTheLockWin(score: scorePlayerTwo, versus: false, highScore: highScore, loss: loserDidLose)
                    }
                }
            }
        }
    }

}
