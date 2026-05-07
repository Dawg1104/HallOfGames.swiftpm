//
//  LarpGame.swift
//  HallOfGames
//
//  Created by Adam F. Kolacia on 4/27/26.
//

import SwiftUI

struct LarpGame: View {
    @AppStorage("lps") var larps: Int = 0
    @AppStorage("alo") var autolarpersowned: Int = 0
    @AppStorage("lso") var larpsahursowned: Int = 0
    @AppStorage("alc") var autolarpercost: Int = 10
    @AppStorage("lps2") var larppsgain: Int = 0
    @AppStorage("lsc") var larpssahurcost: Int = 100
    let lastOpen = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @AppStorage("OLO") var onlinelarpersowned: Int = 0
    @AppStorage("OLC") var onlinelarperscost: Int = 1000
    @AppStorage("PLO") var professionalowned: Int = 0
    @AppStorage("PLC") var professionalcost: Int = 5000
    @AppStorage("foe") var factoryowned: Int = 0
    @AppStorage("foc") var factorycost: Int = 25000
    @AppStorage("CLD") var districtowned: Int = 0
    @AppStorage("CLC") var districtcost: Int = 100000
    @AppStorage("LPCL") var clicksperlarp: Int = 1
    @AppStorage("RBR") var rebirth: Int = 0
    @AppStorage("RBC") var rebirthcost: Int = 1000000
    @State var showAlert: Bool = false
    @AppStorage("STAIRSVICTORY") var stairslarpcost: Int = 1000000
    @AppStorage("StairsVict") var stairslarpowned: Int = 0
    var body: some View {
        VStack {
            Text("Larp Clicker")
                .font(.largeTitle)
            Text("Larps: \(larps)")
            Text("Larps pers second (lps): \(larppsgain)")
            Text("Rebirths: \(rebirth)")
            HStack {
                VStack {
                    Button {
                        larps += clicksperlarp
                    } label: {
                        Image("Larp")
                    }
                    Button("Rebirth: \(rebirthcost)") {
                        if larps >= rebirthcost {
                            rebirth += 1
                            clicksperlarp = Int(Double(clicksperlarp) * 2.0)
                            rebirthcost = Int(Double(rebirthcost) * 10000.0)
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
                    }
                    Text("Owned: \(autolarpersowned)")
                    Button("Buy Auto-Larper, cost \(autolarpercost)") {
                        if larps >= autolarpercost {
                            autolarpersowned += 1
                            larps -= autolarpercost
                            autolarpercost = Int(Double(autolarpercost) * 1.5)
                            larppsgain += 1
                        }
                    }
                    HStack {
                        Image ("Larplarpsahur")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Larp Sahur")
                            .font(.title)
                    }
                    Text("Owned: \(larpsahursowned)")
                    Button("Buy larp sahur, cost \(larpssahurcost)") {
                        if larps >= larpssahurcost {
                            
                            
                            larpsahursowned += 1
                            larps -= larpssahurcost
                            larpssahurcost = Int(Double(larpssahurcost) * 1.5)
                            larppsgain += 10
                        }
                    }
                    
                    HStack {
                        Image ("Larp3")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Online Larper")
                            .font(.title)
                    }
                    Text("Owned: \(onlinelarpersowned)")
                    Button("Buy online larper, cost \(onlinelarperscost)") {
                        if larps >= onlinelarperscost {
                            
                            
                            onlinelarpersowned += 1
                            larps -= onlinelarperscost
                            onlinelarperscost = Int(Double(onlinelarperscost) * 1.5)
                            larppsgain += 100
                        }
                    }
                    HStack {
                        Image ("Larp4")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Professional Larper")
                            .font(.title)
                    }
                    Text("Owned: \(professionalowned)")
                    Button("Buy prof. larper, cost \(professionalcost)") {
                        if larps >= professionalcost {
                            
                            
                            professionalowned += 1
                            larps -= professionalcost
                            professionalcost = Int(Double(professionalcost) * 1.5)
                            larppsgain += 500
                        }
                    }
                    HStack {
                        Image ("Larp5")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Larp Factory")
                            .font(.title)
                    }
                    Text("Owned: \(factoryowned)")
                    Button("Buy factory, cost \(factorycost)") {
                        if larps >= factorycost {
                            
                            
                            factoryowned += 1
                            larps -= factorycost
                            factorycost = Int(Double(factorycost) * 1.5)
                            larppsgain += 2500
                        }
                    }
                    HStack {
                        Image ("Larp6")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Central Larp District")
                            .font(.title)
                    }
                    Text("Owned: \(districtowned)")
                    Button("Buy online larper, cost \(districtcost)") {
                        if larps >= districtcost {
                            
                            
                            districtowned += 1
                            larps -= districtcost
                            districtcost = Int(Double(districtcost) * 1.5)
                            larppsgain += 10000
                        }
                    }
                    HStack {
                        Image ("Larp7")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Stairs Larper")
                            .font(.title)
                    }
                    Text("Owned: \(stairslarpowned)")
                    Button("Buy online larper, cost \(stairslarpcost)") {
                        if larps >= stairslarpcost && rebirth >= 1 {
                            
                            
                            stairslarpowned += 1
                            larps -= stairslarpcost
                            stairslarpcost = Int(Double(stairslarpcost) * 1.5)
                            larppsgain += 100000
                        }
                    }
                }
                }
                }
            
        
            .onReceive(timer) { _ in
                larps += larppsgain}
            
        }
}
    
    

func format(_ num: Int) -> String {
    if num >= 1_000_000 {
        return "\(num / 1_000_000)M"
    } else if num >= 1_000 {
        return "\(num / 1_000)K"
    }
    return "\(num)"
}
