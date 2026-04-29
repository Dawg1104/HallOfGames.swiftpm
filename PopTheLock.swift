import SwiftUI

struct PopTheLock: View {
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
                    NavigationLink(
                        destination: PopTheLockLose(score: loseScore, versus: false),
                                isActive: $didLose,
                                label: { EmptyView() }
                            )
                }
            }
        }
    }
}

struct Lock: View {
    @Binding var score: Int
    @Binding var highScore : Int
    @Binding var didLose: Bool
    @Binding var loseScore: Int
    @State private var time: Double = 0.0
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
            time += 0.005
        }
    }
    
    private func checkCollision() {
        let normalizedTime = time.truncatingRemainder(dividingBy: 1.0)
        let diff = abs(normalizedTime - targetT)
        
        if diff < 0.04 || diff > 0.96 {
            self.targetT = .random(in: generateRandomPos())
            score += 1
        } else {
            highScore = max(score, highScore)
            loseScore = score
            didLose = true
            score = 0
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
    @State var score: Int
    @State var versus: Bool
    @AppStorage("highScore") var highScore: Int = 0
    var body: some View {
        Text("You Lost")
        Text("Your final score: \(score)")
        Text("High Score: \(highScore)")
    }
}
