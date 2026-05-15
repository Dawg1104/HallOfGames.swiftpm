import SwiftUI

struct PopTheLock: View {
    @AppStorage("gamepoints") var gamePoints = 0
    @AppStorage("highScore") var highScore: Int = 0
    @State var score = 0
    @State var loseScore = 0
    @State private var didLose = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.ignoresSafeArea()
                VStack {
                    Text("Score: \(score)")
                        .font(.largeTitle)
                    Lock(score: $score, highScore: $highScore, didLose: $didLose, loseScore:  $loseScore)
                    
                    NavigationLink {
                        PopTheLockVersus()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 100)
                            Text("Versus")
                                .foregroundStyle(.black)
                        }
                    }
                }
                if (didLose) {
                    PopTheLockLose(score: loseScore, versus: false, highScore: highScore, loss: $didLose)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

struct Lock: View {
    @AppStorage("shouldRestart") var shouldRestart = false
    @Binding var score: Int
    @Binding var highScore : Int
    @Binding var didLose: Bool
    @Binding var loseScore: Int
    @State private var time: Double = 0.0
    @State private var timeChangeValue: Double = 0.005
    let timer = Timer.publish(every: 0.016, on: .main, in: .common).autoconnect()
    @State private var targetT: Double = .random(in: generateRandomPos())
    private let paddingValue: CGFloat = 15
    
    var body: some View {
        GeometryReader { proxy in
            let size = min(proxy.size.width, proxy.size.height)
            let outerPadding: CGFloat = size * 0.05
            let ringThickness: CGFloat = size * 0.15
            let orbitRadius: CGFloat = (size / 2) - outerPadding - (ringThickness / 2)
            let targetDiameter: CGFloat = size * 0.12
            let pickerWidth: CGFloat = size * 0.05
            let pickerHeight: CGFloat = size * 0.14
            
            ZStack {
                Circle()
                    .foregroundStyle(.cyan)
                    .padding(outerPadding)
                
                Circle()
                    .foregroundStyle(.yellow)
                    .frame(width: targetDiameter, height: targetDiameter)
                    .offset(calculateOffsetEffect(t: targetT, radius: orbitRadius))
                
                Circle()
                    .foregroundStyle(.blue)
                    .padding(outerPadding + ringThickness)
                
                Capsule()
                    .frame(width: pickerWidth, height: pickerHeight)
                    .rotationEffect(calculateRotationEffect(time: time))
                    .offset(calculateOffsetEffect(t: time, radius: orbitRadius))
                    .foregroundStyle(.red)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onTapGesture {
            checkCollision()
        }
        .onReceive(timer) { _ in
            time += timeChangeValue
        }
        .onChange(of: shouldRestart) { newValue in
            if newValue {
                // Reset for a new round
                targetT = .random(in: generateRandomPos())
                time = .random(in: 0.0...1.0)
                timeChangeValue = 0.005
                score = 0
                didLose = false
                shouldRestart = false
            }
        }
    }
    
    private func checkCollision() {
        let normalizedTime = time.truncatingRemainder(dividingBy: 1.0)
        let diff = abs(normalizedTime - targetT)

        if diff < 0.04 || diff > 0.96 {
            self.targetT = .random(in: generateRandomPos())
            score += 1
            if (timeChangeValue < 0) {
                timeChangeValue *= -1
                timeChangeValue += 0.001
                timeChangeValue *= -1
            } else {
                timeChangeValue += 0.0001
            }
            timeChangeValue *= -1
        } else {
            // Player missed: record loss and show overlay
            highScore = max(score, highScore)
            loseScore = score
            didLose = true
            shouldRestart = false
        }
    }
    
    func calculateRotationEffect(time: Double) -> Angle {
        let angle = time * 2.0 * .pi
        return Angle(radians: angle + (.pi / 2))
    }
    
    func calculateOffsetEffect(t: Double, radius: CGFloat) -> CGSize {
        let angle = t * 2.0 * Double.pi
        let x = cos(angle) * radius
        let y = sin(angle) * radius
        return CGSize(width: x, height: y)
    }
    
    func lerp(a: Double, b: Double, t: Double) -> Double {
        return a + (b - a) * t
    }
}

func generateRandomPos() -> ClosedRange<Double> {
    0.0001...1.0
}

#Preview {
    PopTheLock()
}


struct PopTheLockLose: View {
    @AppStorage("shouldRestart") var shouldRestart = false
    @State var score: Int
    @State var versus: Bool
    @AppStorage("highScore") var highScore: Int = 0
    @Binding var loss: Bool
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
            VStack {
                Image("youLostPTL")
                    .resizable()
                    .scaledToFit()
                Text("Your final score: \(score)")
                    .foregroundStyle(.white)
                Text("High Score: \(highScore)")
                    .foregroundStyle(.white)
                
                Button(action: { loss.toggle(); shouldRestart = true}) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 100, height: 25)
                            .foregroundStyle(.blue)
                        Text("Try Again?")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }
        }
    }
}

struct PopTheLockWin: View {
    @AppStorage("shouldRestart") var shouldRestart = false
    @State var score: Int
    @State var versus: Bool
    @AppStorage("highScore") var highScore: Int = 0
    @Binding var loss: Bool
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
            VStack {
                Image("youWonPTL")
                    .resizable()
                    .scaledToFit()
                Text("Your final score: \(score)")
                    .foregroundStyle(.white)
                Text("High Score: \(highScore)")
                    .foregroundStyle(.white)
                
                Button(action: { loss.toggle(); shouldRestart = true}) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 100, height: 25)
                            .foregroundStyle(.blue)
                        Text("Try Again?")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }
        }
    }
}
