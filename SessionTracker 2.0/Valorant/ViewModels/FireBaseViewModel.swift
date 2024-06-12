//
//  FireBaseService.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 6/5/24.
//

import Foundation
import Firebase

class FirebaseViewModel: ObservableObject {
    
    @Published var gameStats: [valorantGameModel] = []
    
    var totalWins: Int {
        var result = 0
        for game in gameStats {
            if game.didWin == true {
                result += 1
            }
        }
        return result
    }
    var totalLosses: Int {
        var resultLoss = 0
        for game in gameStats {
            if game.didWin == false {
                resultLoss += 1
            }
        }
        return resultLoss
    }
    var winPercentage: Double {
        var win = 0.0
        for game in gameStats {
            if game.didWin == true {
                win += 1.0
            }
        }
        let winRate: Double = (win / Double(gameStats.count)) * 100
        let roundWinRate = round(winRate * 100) / 100.0
        return roundWinRate
    }
    var averageACS: Double {
        var sum = 0
        for game in gameStats {
            sum += game.ACS
        }
        let average: Double = (Double(sum) / Double(gameStats.count))
        let roundedAverage = round(average * 100) / 100.0
        return roundedAverage
    }
    var totalKills: Int {
        var sumKills = 0
        for game in gameStats {
            sumKills += Int(game.kills)
        }
        return sumKills
    }
    var totalDeaths: Int {
        var sumDeaths = 0
        for game in gameStats {
            sumDeaths += Int(game.deaths)
        }
        return sumDeaths
    }
    var totalKD: Double {
        var kill = 0.0
        var death = 0.0
        for game in gameStats {
            kill += game.kills
            death += game.deaths
        }
        let divide: Double = kill / death
        let roundDivide: Double = round(divide * 100) / 100.0
        return roundDivide
    }
    let db = Firestore.firestore()
    
    init(){
        
    }
//    let shared = FirebaseService()
    func observeGameStatsFromFirebase() {
        db.collection("valorant").addSnapshotListener { snapshot, error in
            if let err = error {
                print("\(err.localizedDescription)")
                return
            }
            self.gameStats.removeAll()
            if let snap = snapshot {
                for item in snap.documents {
                    let stat = valorantGameModel(data: item.data())
                    self.gameStats.append(stat)
                }
            }
        }
    }
    func saveGameStatToFirebase(gameStat: valorantGameModel) {
        db.collection("valorant").document(gameStat.id).setData(gameStat.toDictionaryValue()) {
            error in
            if let err = error {
                print("\(err)")
            } else {
                print("Successfully sent data to firbase")
            }
        }
    }
}
