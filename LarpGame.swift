//
//  LarpGame.swift
//  HallOfGames
//
//  Created by Adam F. Kolacia on 4/27/26.
//

import SwiftUI

struct LarpGame: View {
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("lps") var larps: Double = 0
    @AppStorage("alo") var autolarpersowned: Double = 0
    @AppStorage("lso") var larpsahursowned: Double = 0
    @AppStorage("alc") var autolarpercost: Double = 10
    @AppStorage("lps2") var larppsgain: Double = 0
    @AppStorage("lsc") var larpssahurcost: Double = 100
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @AppStorage("OLO") var onlinelarpersowned: Double = 0
    @AppStorage("OLC") var onlinelarperscost: Double = 1000
    @AppStorage("PLO") var professionalowned: Double = 0
    @AppStorage("PLC") var professionalcost: Double = 5000
    @AppStorage("foe") var factoryowned: Double = 0
    @AppStorage("foc") var factorycost: Double = 25000
    @AppStorage("CLD") var districtowned: Double = 0
    @AppStorage("CLC") var districtcost: Double = 100000
    @AppStorage("LPCL") var clicksperlarp: Double = 1
    @AppStorage("RBR") var rebirth: Double = 0
    @AppStorage("RBC") var rebirthcost: Double = 1000000
    @State var showAlert: Bool = false
    @AppStorage("STAIRSVICTORY") var stairslarpcost: Double = 10000000
    @AppStorage("StairsVict") var stairslarpowned: Double = 0
    @AppStorage("LarpF") var larpgroupowned: Double = 0
    @AppStorage("LarpFCost") var larpgroupcost: Double = 100000000
    @AppStorage("LarpEmperor") var larpwmpowned: Double = 0
    @AppStorage("LarpEmperorCost") var larpwmpcost: Double = 1000000000
    @AppStorage("LarpgodCost") var larpgodcost: Double = 10000000000000
    @AppStorage("LPGO") var larpgodowned: Double = 0
    @AppStorage("gamepoints") var gamepoints: Double = 0
    @AppStorage("fLO") var finallarperowned: Double = 0
    @AppStorage("FLC") var finallarpercost: Double = 10000000000000000000
    @AppStorage("lastClosedTime") var lastClosedTime: Double = Date().timeIntervalSince1970
    @State private var offlineLarps: Double = 0
    @State private var showOfflineAlert = false
    func calculateOfflineEarnings() {
        let now = Date().timeIntervalSince1970
        let secondsAway = now - lastClosedTime
        
        if secondsAway > 0 {
            offlineLarps = larppsgain * secondsAway
            larps += offlineLarps
            showOfflineAlert = true
        }
        
        lastClosedTime = now
    }
    var body: some View {
        
        VStack {
            ZStack {
                
                Image("larpbg")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
                    Text("Larp Clicker")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    Text("Larps: \(format(larps))")
                        .foregroundStyle(.white)
                    Text("Larps per second (LPS): \(format(larppsgain))")
                        .foregroundStyle(.white)
                    Text("Rebirths: \(format(rebirth))")
                        .foregroundStyle(.white)
                    HStack {
                        VStack {
                            Button {
                                larps += clicksperlarp
                            } label: {
                                Image("Larp")
                            }
                            Button("Rebirth: \(format(rebirthcost))") {
                                if larps >= rebirthcost {
                                    rebirth += 1
                                    clicksperlarp = (Double(clicksperlarp) * 2.0)
                                    rebirthcost = (Double(rebirthcost) * 2.0)
                                    larps = 0
                                    autolarpersowned = 0
                                    larpsahursowned = 0
                                    larppsgain = 0
                                    onlinelarperscost = 1000
                                    onlinelarpersowned = 0
                                    autolarpercost = 10
                                    larpssahurcost = 100
                                    professionalcost = 5000
                                    professionalowned = 0
                                    factorycost = 25000
                                    factoryowned = 0
                                    districtowned = 0
                                    districtcost = 100000
                                    stairslarpcost = 1000000
                                    stairslarpowned = 0
                                    larpgroupcost = 10000000
                                    larpgroupowned = 0
                                    larpwmpcost = 100000000
                                    larpwmpowned = 0
                                    larpgodcost = 100000000000
                                    larpgodowned = 0
                                    finallarpercost = 10000000000000000
                                    finallarperowned = 0
                                    lastClosedTime = Date().timeIntervalSince1970
                                    
                                }
                            }
                            
                        }
                        ScrollView {
                            HStack {
                                Image("autolarp")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("Auto-Larper")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(autolarpersowned))")
                                .foregroundStyle(.white)
                            Button("Buy Auto-Larper, cost \(format(autolarpercost))") {
                                if larps >= autolarpercost {
                                    autolarpersowned += 1
                                    larps -= autolarpercost
                                    autolarpercost = (Double(autolarpercost) * 1.5)
                                    larppsgain += 1
                                }
                            }
                            HStack {
                                Image ("Larplarpsahur")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Larp Sahur")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(larpsahursowned))")
                                .foregroundStyle(.white)
                            Button("Buy larp sahur, cost \(format(larpssahurcost))") {
                                if larps >= larpssahurcost {
                                    
                                    
                                    larpsahursowned += 1
                                    larps -= larpssahurcost
                                    larpssahurcost = (Double(larpssahurcost) * 1.5)
                                    larppsgain += 10
                                }
                            }
                            
                            HStack {
                                Image ("Larp3")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Online Larper")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(onlinelarpersowned))")
                                .foregroundStyle(.white)
                            Button("Buy online larper, cost \(format(onlinelarperscost))") {
                                if larps >= onlinelarperscost {
                                    
                                    
                                    onlinelarpersowned += 1
                                    larps -= onlinelarperscost
                                    onlinelarperscost = (Double(onlinelarperscost) * 1.5)
                                    larppsgain += 100
                                }
                            }
                            HStack {
                                Image ("Larp4")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Professional Larper")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(professionalowned))")
                                .foregroundStyle(.white)
                            Button("Buy prof. larper, cost \(format(professionalcost))") {
                                if larps >= professionalcost {
                                    
                                    
                                    professionalowned += 1
                                    larps -= professionalcost
                                    professionalcost = (Double(professionalcost) * 1.5)
                                    larppsgain += 500
                                }
                            }
                            HStack {
                                Image ("Larp5")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Larp Factory")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(factoryowned))")
                                .foregroundStyle(.white)
                            Button("Buy factory, cost \(format(factorycost))") {
                                if larps >= factorycost {
                                    
                                    
                                    factoryowned += 1
                                    larps -= factorycost
                                    factorycost = (Double(factorycost) * 1.5)
                                    larppsgain += 2500
                                }
                            }
                            HStack {
                                Image ("Larp6")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Central Larp District")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(districtowned))")
                                .foregroundStyle(.white)
                            Button("Buy central larp district, cost \(format(districtcost))") {
                                if larps >= districtcost {
                                    
                                    
                                    districtowned += 1
                                    larps -= districtcost
                                    districtcost = (Double(districtcost) * 1.5)
                                    larppsgain += 10000
                                }
                            }
                            HStack {
                                Image ("Larp7")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Stairs Larper")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(stairslarpowned))")
                                .foregroundStyle(.white)
                            Button("Buy stairs larper, cost \(format(stairslarpcost)), 1 rebirth needed") {
                                if larps >= stairslarpcost && rebirth >= 1 {
                                    
                                    
                                    stairslarpowned += 1
                                    larps -= stairslarpcost
                                    stairslarpcost = (Double(stairslarpcost) * 1.5)
                                    larppsgain += 100000
                                }
                            }
                            HStack {
                                Image ("Larp8")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Ultimate Larper")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(larpgroupowned))")
                                .foregroundStyle(.white)
                            Button("Buy ultimate larper, cost \(format(larpgroupcost)), 3 rebirths needed") {
                                if larps >= larpgroupcost && rebirth >= 3 {
                                    
                                    
                                    larpgroupowned += 1
                                    larps -= larpgroupcost
                                    larpgroupcost = (Double(larpgroupcost) * 1.5)
                                    larppsgain += 1000000
                                }
                            }
                            HStack {
                                Image ("larp9")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Emperor Larper")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(larpwmpowned))")
                                .foregroundStyle(.white)
                            Button("Buy larp emperor, cost \(format(larpwmpcost)), 7 rebirths needed") {
                                if larps >= larpwmpcost && rebirth >= 7 {
                                    
                                    
                                    larpwmpowned += 1
                                    larps -= larpwmpcost
                                    larpwmpcost = (Double(larpwmpcost) * 1.5)
                                    larppsgain += 10000000
                                }
                            }
                            HStack {
                                Image ("Larp10")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Larp god")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(larpgodowned))")
                                .foregroundStyle(.white)
                            Button("Buy larp god, cost \(format(larpgodcost)), 15 rebirths needed") {
                                if larps >= larpgodcost && rebirth >= 15 {
                                    
                                    
                                    larpgodowned += 1
                                    larps -= larpgodcost
                                    larpgodcost = (Double(larpgodcost) * 1.5)
                                    larppsgain += 1000000000
                                }
                            }
                            HStack {
                                Image ("Larp11")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Final Larper")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                            Text("Owned: \(format(finallarperowned))")
                                .foregroundStyle(.white)
                            Button("Buy final larper, cost \(format(finallarpercost)), 32 rebirths needed") {
                                if larps >= finallarpercost && rebirth >= 32 {
                                    
                                    
                                    finallarperowned += 1
                                    larps -= finallarpercost
                                    finallarpercost = (Double(finallarpercost) * 1.5)
                                    larppsgain += 100000000000000000
                                }
                            }
                        }
                    }
                }
            }
            
            .onReceive(timer) { _ in
                larps += larppsgain
            }
            .onAppear {
                calculateOfflineEarnings()
            }
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .background {
                    lastClosedTime = Date().timeIntervalSince1970
                }
            }
            .alert("Offline Earnings", isPresented: $showOfflineAlert) {
                Button("Nice") { }
            } message: {
                Text("Your larpers generated \(format(offlineLarps)) larps while you were away.")
            }
            
        }
    }
}
        
        func format(_ num: Double) -> String {
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 0
            formatter.numberStyle = .decimal
            if num >= 1_000_000_000_000_000_000_000 {
                return "\(formatter.string(from: NSNumber(value: num / 1_000_000_000_000_000_000_000)) ?? "0")SX"
            } else if num >= 1_000_000_000_000_000_000 {
                return "\(formatter.string(from: NSNumber(value: num / 1_000_000_000_000_000_000)) ?? "0")QI"
            } else if num >= 1_000_000_000_000_000 {
                return "\(formatter.string(from: NSNumber(value: num / 1_000_000_000_000_000)) ?? "0")QD"
            } else if num >= 1_000_000_000_000 {
                return "\(formatter.string(from: NSNumber(value: num / 1_000_000_000_000)) ?? "0")T"
            } else if num >= 1_000_000_000 {
                return "\(formatter.string(from: NSNumber(value: num / 1_000_000_000)) ?? "0")B"
            } else if num >= 1_000_000 {
                return "\(formatter.string(from: NSNumber(value: num / 1_000_000)) ?? "0")M"
            } else if num >= 1_000 {
                return "\(formatter.string(from: NSNumber(value: num / 1_000)) ?? "0")K"
            }
            return formatter.string(from: NSNumber(value: num)) ?? "0"
        }
        
 

