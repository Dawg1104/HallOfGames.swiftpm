


import SwiftUI
import AVFoundation

struct FNAJAView: View {
    @Environment(\.openURL) var openURL
    
    @State var chisenhidingspot = 0
    @State var jobscare = 0
    @State var jobscare2 = 0
    @State var jobscare3 = 0
    @State var jobscare4 = 0
    @State var playSound = false
    @State var nightSystem = 1
    @State var showJumpscare = false
    @State var showRedFlash = false
    @State var scale: CGFloat = 0.1
    @State var showjumpscare1987 = false
    @State var show1987Flash = false
    
    let myUrl = URL(string: "https://www.airforce.com/apply-now")!
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 16) {
                
                Text("FIVE NIGHTS AT JOB APPLICATION'S")
                    .padding()
                Text("Night \(nightSystem)")
                Text("Enter hiding spot 1–5 ok?")
                
                TextField("Enter hiding spot", value: $chisenhidingspot, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: 150)
                
                Image("J*b")
                
                Button("Start") {
                    jobscare = Int.random(in: 1...9)
                    jobscare2 = Int.random(in: 1...9)
                    jobscare3 = Int.random(in: 1...9)
                    jobscare4 = Int.random(in: 1...9)
                    if jobscare == 1 && jobscare2 == 9 && jobscare3 == 8 && jobscare4 == 7 && nightSystem == 6 {
                        showjumpscare1987 = true
                        show1987Flash = true
                        scale = 34.0
                        
                        nightSystem = 1
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.5)) {
                            scale = 35.0
                            
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            withAnimation(.easeOut(duration: 0.2)) {
                                show1987Flash = false
                            }
                        }
                        
                    }
                    if chisenhidingspot == 1987 {
                        jobscare = 1
                        jobscare2 = 9
                        jobscare3 = 8
                        jobscare4 = 7
                    }
                    let hit =
                    jobscare == chisenhidingspot ||
                    jobscare2 == chisenhidingspot ||
                    jobscare3 == chisenhidingspot ||
                    jobscare4 == chisenhidingspot
                    
                    if hit {
                        showJumpscare = true
                        showRedFlash = true
                        scale = 0.1
                        nightSystem = 1
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.5)) {
                            scale = 1.0
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            withAnimation(.easeOut(duration: 0.2)) {
                                showRedFlash = false
                            }
                        }
                    } else {
                        showJumpscare = false
                        scale = 0.1
                        nightSystem += 1
                    }
                    if nightSystem == 7 {
                        nightSystem = 1
                        
                    }
                }
            }
            
            
            if showJumpscare {
                Button {
                    openURL(myUrl)
                    showJumpscare = false
                } label: {
                    Image("J*b Monster")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .scaleEffect(scale)
                }
            }
            if showjumpscare1987 == true {
                
                
                
                Button {
                    openURL(myUrl)
                    
                    showjumpscare1987 = false
                } label: {
                    Image("Golden Freddy J*b Monster")
                }
            }
        }
    }
}
