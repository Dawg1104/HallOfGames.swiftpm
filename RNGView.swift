

import SwiftUI

struct RNGView: View {
    @State var rngNumber = 0
    @State var bestAuras = [""]
    @AppStorage("rolls") var rolls = 0
    @State var auraGiven = ""
    @AppStorage("Name") var name = ""
    @State var globalmessage1: String = "has reached ASTRAL DIVINITY"
    @State var globalmessge2: String = "The unstoppable wave"
    @State var globalmessage3: String = "the jungle dragon is approaching"
    @State var globalmessage4 = "has been consumed by a BLINDING LIGHT"
    @State var globalmessage5 = "The balance has ben restored by "
    @State var globalmessage6 = "An ancient rage has been awoken by the king,"
    @State var globalmessage7 = "has pixelated in our world"
    @State var globalmessage8 = "A strange scape has opened in wake of"
    @State var globalmessage9 = "An eternal void has swallowed"
    @State var globalmessage10 = "The world shimmers in the light of the gem, "
    @State var ultimateglobalmessage = "All hail,"
    @AppStorage("King") var Monarchisobtained = false
    @AppStorage("Opaqueking") var monarchopacity = 0.0
    @AppStorage("Wave") var tsuanmiopacity = 0.0
    @AppStorage("Waveopaque") var tsunamiisobtained = false
    @AppStorage("nullsca") var nullscapeisobtained = false
    @AppStorage("nullscaopaque") var nullscapeopacity = 0.0
    @AppStorage("voidhea") var voidheartisobtained = false
    @AppStorage("voidheaopaque") var voidheartopacity = 0.0
    @AppStorage("amethyst") var amethystisobtained = false
    @AppStorage("amethystopaque") var amethystopacity = 0.0
    @AppStorage("pixel") var pixelisobtained = false
    @AppStorage("pixelopaque") var pixelopacity = 0.0
    @AppStorage("galacticopaque") var spacegalacticopacity = 0.0
    @AppStorage("galacticobtained") var spacegalacticisobtained = false
    @AppStorage("equiobat") var equiisobtained = false
    @AppStorage("uquiopaq") var equiopacity = 0.0
    @AppStorage("yahrobt") var yharonisobtained = false
    @AppStorage("yhoq") var yharonopacity = 0.0
    @AppStorage("ilob") var illumisobtained = false
    @AppStorage("iloq") var illumopacity = 0.0
    @AppStorage("kinob") var Kingisobtained = false
    @AppStorage("kinoq") var kingopacity = 0.0
    @AppStorage("commob") var commonisobtained = false
    @AppStorage("uncommon") var uncommonisobtained = false
    @AppStorage("rare") var rareisobtained = false
    @AppStorage("epic") var epicisobtained = false
    @AppStorage("legendary") var legendaryisobtained = false
    @AppStorage("mythic") var mythicisobtained = false
    @AppStorage("insane") var Insaneisobtained = false
    @AppStorage("pen") var Pencilsisobtained = false
    @AppStorage("light") var lightningisobtained = false
    @AppStorage("fal e") var falmeisobtained = false
    @AppStorage("glac") var glacierisobtained = false
    @AppStorage("rose") var roseisobtained = false
    @AppStorage("shark") var Sharkfinisobtained = false
    @AppStorage("colored") var Coloredisobtained = false
    @AppStorage("solice") var soliceisobtained = false
    @AppStorage("lunis") var lunisobtained = false
    @AppStorage("error") var errorisobatined = false
    @AppStorage("lengendarial") var legendarialisobtained = false
    @AppStorage("winstr") var windstormisobtained = false
    @AppStorage("jackpo") var jackpotisobtained = false
    @AppStorage("hellfir") var Hellfireisobtained = false
    @AppStorage("frosti") var Frostisobtained = false
    @AppStorage("histor") var historicisobtained = false
    @AppStorage("gravi") var gravityisobtained = false
    @AppStorage("greatwhi") var greatwhiteisobtained = false
    @AppStorage("magica") var magicalisobtained = false
    @AppStorage("spaceis") var spaceisobtained = false
    @State var plswork = false
    @AppStorage("folw") var flowerfield = false
    @AppStorage("olympian") var olympianisobtained = false
    @AppStorage("lowtid") var lowtideisobtained = false
    @AppStorage("pasti") var pastisobatined = false
    @AppStorage("Plane") var planetaryisobtained = false
    @AppStorage("daybr") var daybreakisobtained = false
    @AppStorage("nightfa") var nightfallisobtained = false
    @AppStorage("tornad") var tornadoisobtained = false
    @AppStorage("Void") var voidedisobtained = false
    @AppStorage("pres") var historicpresisobtained = false
    @AppStorage("samu") var samurisobtained = false
    @AppStorage("thund") var thunderisobtained = false
    @AppStorage("infern") var infernisobtained = false
    @AppStorage("hero") var olympianheroisobtained = false
    @AppStorage("ange") var angelicisobtained = false
    @AppStorage("Stella") var Stellarisobtained = false
    @AppStorage("archai") var hackisobtained = false
    @AppStorage("hack") var hackedisobtained = false
    @AppStorage("Justice") var justiceisobtained = false
    @AppStorage("RGB") var RGBisobtained = false
    @AppStorage("Evil") var evilisobtained = false
    @AppStorage("futur") var futureisobtained = false
    @AppStorage("pBlack Hole") var blackholeisobtained = false
    @AppStorage("supercali") var supercaliisobtained = false
    @AppStorage("pFinale") var Finaleisobtained = false
    @AppStorage("Godhood") var goodhoodisobtained = false
    @AppStorage("Darkscape") var darkscaisobtained = false
    @AppStorage("Titanic") var titanicisobtained = false
    @AppStorage("Hues") var huesisobtained = false
    @AppStorage("Tidal Wave") var tidalwaveisobtained = false
    @AppStorage("Served") var servedisobtained = false
    @AppStorage("tart") var tartarsauceisobtained = false
    @AppStorage("Excalib") var excalibisobtained = false
    @AppStorage("What If?") var whatifisobtained = false
    @AppStorage("chrysalis") var chrysisobtained = false
    
    @AppStorage("rarestAura") var rarestAura = ""
    @AppStorage("LuckRNG") var luck: Double = 1.0
    
    let auralist: [weightedRNG] = [
        weightedRNG(auraName: "Common", chance: 40.0),
        weightedRNG(auraName: "Uncommon", chance: 20.0),
        weightedRNG(auraName: "Rare", chance: 15.0),
        weightedRNG(auraName: "Epic", chance: 6.0),
        weightedRNG(auraName: "Legendary", chance: 3.0),
        weightedRNG(auraName: "Mythical", chance: 2.0),
        weightedRNG(auraName: "1ns4n3", chance: 1.0),
        weightedRNG(auraName: "Pencils", chance: 0.4),
        weightedRNG(auraName: "Lightning", chance: 0.2),
        weightedRNG(auraName: "Flame", chance: 0.1),
        weightedRNG(auraName: "Glacier", chance: 0.04),
        weightedRNG(auraName: "Rose", chance: 0.02),
        weightedRNG(auraName: "Sharkfin", chance: 0.01),
        weightedRNG(auraName: "Pencils: Colored", chance: 0.004),
        weightedRNG(auraName: "Solice", chance: 0.002),
        weightedRNG(auraName: "Lunis", chance: 0.002),
        weightedRNG(auraName: "1ns4n3: 3rr0r", chance: 0.001),
        weightedRNG(auraName: "Mythical: Legendarial", chance: 0.0006),
        weightedRNG(auraName: "Windstorm", chance: 0.0005),
        weightedRNG(auraName: "Jackpot", chance: 0.0004),
        weightedRNG(auraName: "Flame: Hellfire", chance: 0.0003),
        weightedRNG(auraName: "Glacier: Frost", chance: 0.00025),
        weightedRNG(auraName: "Historic", chance: 0.0002),
        weightedRNG(auraName: "Gravity", chance: 0.000175),
        weightedRNG(auraName: "Sharkfin: Great White", chance: 0.00013),
        weightedRNG(auraName: "Magical", chance: 0.0001),
        weightedRNG(auraName: "Space", chance: 0.000075),
        weightedRNG(auraName: "Code", chance: 0.000066),
        weightedRNG(auraName: "Rose: Flowerfield", chance: 0.000055),
        weightedRNG(auraName: "Olympian", chance: 0.00005),
        weightedRNG(auraName: "Low Tide", chance: 0.00004),
        weightedRNG(auraName: "Historic: Past", chance: 0.000033),
        weightedRNG(auraName: "Space: Planetary", chance: 0.00003),
        weightedRNG(auraName: "Solis: Daybreak", chance: 0.000025),
        weightedRNG(auraName: "Lunis: Nightfall", chance: 0.000025),
        weightedRNG(auraName: "Windstorm: Tornado", chance: 0.00002),
        weightedRNG(auraName: "Voided", chance: 0.000018),
        weightedRNG(auraName: "Historic: Present", chance: 0.0000166),
        weightedRNG(auraName: "Samurai", chance: 0.000015),
        weightedRNG(auraName: "Lightning: Thunderstruck", chance: 0.000014),
        weightedRNG(auraName: "Inferno", chance: 0.0000125),
        weightedRNG(auraName: "Olympian: Hero", chance: 0.000012),
        weightedRNG(auraName: "Angelical", chance: 0.000011),
        weightedRNG(auraName: "Space: Stellar", chance: 0.00001),
        weightedRNG(auraName: "Magical: Archaic", chance: 0.0000066),
        weightedRNG(auraName: "Code: Hack3d", chance: 0.0000055),
        weightedRNG(auraName: "Justice", chance: 0.000005),
        weightedRNG(auraName: "RGB", chance: 0.000004),
        weightedRNG(auraName: "Magical: Evil", chance: 0.0000033),
        weightedRNG(auraName: "Historic: Future", chance: 0.000003),
        weightedRNG(auraName: "Space: Black Hole", chance: 0.0000025),
        weightedRNG(auraName: "SuPeRcAlIfRaGiLiStIcExPiAlAdOcIoUs!", chance: 0.0000021),
        weightedRNG(auraName: "Finale", chance: 0.000002),
        weightedRNG(auraName: "Olympian: Godhood", chance: 0.00000175),
        weightedRNG(auraName: "Darkscape", chance: 0.00000166),
        weightedRNG(auraName: "Glacier: Titanic", chance: 0.0000015),
        weightedRNG(auraName: "RGB: Hues", chance: 0.000001),
        weightedRNG(auraName: "Tidal Wave", chance: 0.00000075),
        weightedRNG(auraName: "Justice: Served", chance: 0.00000066),
        weightedRNG(auraName: "Tartarus", chance: 0.0000005),
        weightedRNG(auraName: "Excalibur", chance: 0.00000045),
        weightedRNG(auraName: "Historic: What If?", chance: 0.0000004),
        weightedRNG(auraName: "Chrysalis", chance: 0.00000033),
        weightedRNG(auraName: "Winter Vacation", chance: 0.0000003),
        weightedRNG(auraName: "Inferno: Hellsinge", chance: 0.00000025),
        weightedRNG(auraName: "RGB: Hex Values", chance: 0.0000002),
        weightedRNG(auraName: "Finale: Last Dance", chance: 0.000000175),
        weightedRNG(auraName: "Mage of Hell", chance: 0.000000166),
        weightedRNG(auraName: "Terrarium", chance: 0.00000016),
        weightedRNG(auraName: "Emperor", chance: 0.00000015),
        weightedRNG(auraName: "Blossom", chance: 0.000000125),
        weightedRNG(auraName: "Angelical: Fallen Angel", chance: 0.00000011),
        weightedRNG(auraName: "Space: Galactic", chance: 0.0000001),
        weightedRNG(auraName: "Tsunami", chance: 0.000000075),
        weightedRNG(auraName: "Terrarium: Jungle Dragon", chance: 0.000000066),
        weightedRNG(auraName: "Angelical: Illuminated", chance: 0.00000005),
        weightedRNG(auraName: "Equivalence", chance: 0.00000004),
        weightedRNG(auraName: "King of Beasts", chance: 0.000000033),
        weightedRNG(auraName: "P1x3lW4v3", chance: 0.00000003),
        weightedRNG(auraName: "Nullscape", chance: 0.00000002),
        weightedRNG(auraName: "Voidheart", chance: 0.0000000166),
        weightedRNG(auraName: "Chrysalis: Amethyst", chance: 0.0000000125),
        weightedRNG(auraName: "The Monarch of All", chance: 0.00000001),
        weightedRNG(auraName: "Bulgaria", chance: 0.0003)
    ]
    
    
    func adjustedList() -> [weightedRNG] {
        auralist.map { aura in
            
            var newChance = aura.chance
            
            if aura.auraName == "Common" {
                newChance = aura.chance / (1 + luck * 1.5)
            } else if aura.chance < 0.001 {
                newChance = aura.chance * (1 + luck * 1.2)
            } else {
                newChance = aura.chance * (1 + luck * 0.3)
            }
            
            return weightedRNG(
                auraName: aura.auraName,
                chance: newChance
            )
        }
    }
    
    
    func auraRank(_ name: String) -> Double {
        auralist.first(where: { $0.auraName == name })?.chance ?? 0
    }
    
    
    var body: some View {
        VStack {
            Text("Hall of Games' RNG")
                .padding()
            TextField("Enter Your Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
            Text("Luck x\(luck)")
            Text("Rolls: \(rolls)")
                .padding()
            Button(action: {
                
                if let rolled = weightedRoll(auras: adjustedList()) {
                    auraGiven = rolled.auraName
                }
                
                rolls += 1
                
                if auraGiven == "Mythical" ||
                    auraRank(auraGiven) <= 0.0001 {
                    
                    luck += 0.5
                }
                
                
                if rarestAura.isEmpty || auraRank(auraGiven) < auraRank(rarestAura) {
                    rarestAura = auraGiven
                }
                
                
                
                
                if auraGiven == "The Monarch of All" {
                    monarchopacity = 0.8
                    Monarchisobtained = true
                } else if auraGiven == "Tsunami" {
                    tsunamiisobtained = true
                    tsuanmiopacity = 0.8
                } else if auraGiven == "Nullscape" {
                    nullscapeisobtained = true
                    nullscapeopacity = 0.8
                } else if auraGiven == "Voidheart" {
                    voidheartisobtained = true
                    voidheartopacity = 0.8
                } else if auraGiven == "Chrysalis: Amethyst" {
                    amethystopacity = 0.8
                    amethystisobtained = true
                } else if auraGiven == "P1x3lW4v3" {
                    pixelopacity = 0.8
                    pixelisobtained = true
                } else if auraGiven == "Space: Galactic" {
                    spacegalacticopacity = 0.8
                    spacegalacticisobtained = true
                } else if auraGiven == "Equivalence" {
                    equiopacity = 0.8
                    equiisobtained = true
                } else if auraGiven == "Terrarium: Jungle Dragon" {
                    yharonisobtained = true
                    yharonopacity = 0.8
                } else if auraGiven == "Angelical: Illuminated" {
                    illumopacity = 0.8
                    illumisobtained = true
                } else if auraGiven == "King of Beasts" {
                    kingopacity = 0.8
                    Kingisobtained = true
                }
                
                
                
            }, label: {
                Text("ROLL")
            })
            if rolls == 100 {
                
            } else if rolls == 1000 {
                
            } else if rolls == 10000 {
                
            } else if rolls == 100000 {
                
            }
            Text(auraGiven)
            Text("\(name) \(globalmessage1)")
                .opacity(spacegalacticopacity)
            Text("\(globalmessge2) \(name) is approaching")
                .opacity(tsuanmiopacity)
            Text("\(name )\(globalmessage3)")
                .opacity(yharonopacity)
            Text("\(name) \(globalmessage4)")
                .opacity(illumopacity)
            Text("\(globalmessage5) \(name)")
                .opacity(equiopacity)
            Text("\(globalmessage6) \(name)")
                .opacity(kingopacity)
            Text("\(name) \(globalmessage7)")
                .opacity(pixelopacity)
            Text("\(globalmessage8) \(name)")
                .opacity(nullscapeopacity)
            Text("\(globalmessage9) \(name) whole")
                .opacity(voidheartopacity)
            Text("\(globalmessage10) \(name)")
                .opacity(amethystopacity)
            Text("\(ultimateglobalmessage) \(name), the king")
                .opacity(monarchopacity)
            
            Text("Rarest Aura Rolled: \(rarestAura)")
            
        }
    }
}
func plswork() {
    let plswork = true
    
}




