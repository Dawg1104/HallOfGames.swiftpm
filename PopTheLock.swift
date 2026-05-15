import SwiftUI



struct PopTheLock: View {
    @AppStorage("gamepoints") var gamePoints = 0
    @AppStorage("highScore") var highScore: Int = 0
    @AppStorage("themeChoice") var themeChoice: Int = .random(in: 0...1)
    // 0 -- Blue
    // 1 -- Green
    @State var score = 0
    @State var loseScore = 0
    @State private var didLose = false

    @State var themeColor: Color
    @State var pickColor: Color
    @State var areaColor: Color
    @State var ringColor: Color
    @State var innerCircleColor: Color

    init() {
        // Initialize state wrappers with safe defaults, then apply stored theme
        _themeColor = State(initialValue: .blue)
        _pickColor = State(initialValue: .red)
        _areaColor = State(initialValue: .yellow)
        _ringColor = State(initialValue: .cyan)
        _innerCircleColor = State(initialValue: .blue.opacity(0.5))

        let choice = UserDefaults.standard.integer(forKey: "themeChoice")
        applyTheme(choice)
    }

    private func applyTheme(_ choice: Int) {
        switch choice {
        case 1: // Green theme
            themeColor = .green
            pickColor = .white
            areaColor = .yellow
            ringColor = Color(red: 0.0, green: 0.6, blue: 0.0)
            innerCircleColor = Color(red: 0.0, green: 0.6, blue: 0.4)
        default: // Blue theme
            themeColor = .blue
            pickColor = .red
            areaColor = .yellow
            ringColor = .cyan
            innerCircleColor = .blue
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                themeColor.ignoresSafeArea()
                VStack {
                    Text("Score: \(score)")
                        .font(.largeTitle)
                    Lock(
                        score: $score,
                        highScore: $highScore,
                        didLose: $didLose,
                        loseScore:  $loseScore,
                        themeColor: themeColor,
                        pickColor: pickColor,
                        areaColor: areaColor,
                        ringColor: ringColor,
                        innerCircleColor: innerCircleColor
                    )

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
                if didLose {
                    PopTheLockLose(score: loseScore, versus: false, highScore: highScore, loss: $didLose)
                        .ignoresSafeArea()
                }
            }
        }
        .onAppear {
            let random = Int.random(in: 0...2)
            themeChoice = random
            applyTheme(random)
        }
    }
}

struct Lock: View {
    @AppStorage("shouldRestart") var shouldRestart = false
    @Binding var score: Int
    @Binding var highScore : Int
    @Binding var didLose: Bool
    @Binding var loseScore: Int
    let themeColor: Color
    let pickColor: Color
    let areaColor: Color
    let ringColor: Color
    let innerCircleColor: Color
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
                    .foregroundStyle(ringColor)
                    .padding(outerPadding)
                
                Circle()
                    .foregroundStyle(areaColor)
                    .frame(width: targetDiameter, height: targetDiameter)
                    .offset(calculateOffsetEffect(t: targetT, radius: orbitRadius))
                
                Circle()
                    .foregroundStyle(innerCircleColor)
                    .padding(outerPadding + ringThickness)
                
                Capsule()
                    .frame(width: pickerWidth, height: pickerHeight)
                    .rotationEffect(calculateRotationEffect(time: time))
                    .offset(calculateOffsetEffect(t: time, radius: orbitRadius))
                    .foregroundStyle(pickColor)
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



