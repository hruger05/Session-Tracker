//
//  SessionTracking.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 5/22/24.
//

import SwiftUI

class GameStat: Identifiable, Codable, ObservableObject {
    var didWin:Bool
    var kills:Double
    var deaths:Double
    var ACS:Int
    var roundsLost:Int
    var roundsWon:Int
    var id: String = UUID().uuidString
    
    init(didWin: Bool, kills: Double, deaths: Double, ACS: Int, roundsLost: Int, roundsWon: Int, id: String = UUID().uuidString) {
        self.didWin = didWin
        self.kills = kills
        self.deaths = deaths
        self.ACS = ACS
        self.roundsLost = roundsLost
        self.roundsWon = roundsWon
        self.id = id
    }
    
    init(data: [String : Any]) {
        self.didWin = data["didWin"] as? Bool ?? false
        self.kills = data["kills"] as? Double ?? -1.0
        self.deaths = data["deaths"] as? Double ?? -1.1
        self.ACS = data["ACS"] as? Int ?? -1
        self.roundsLost = data["roundsLost"] as? Int ?? -2
        self.roundsWon = data["roundsWon"] as? Int ?? -3
        self.id = data["id"] as? String ?? "FAILURE//ID"
    }
    func toDictionaryValue() -> [String : Any] {
        return [
            "didWin" : self.didWin,
            "kills" : self.kills,
            "deaths" : self.deaths,
            "ACS" : self.ACS,
            "roundsLost" : self.roundsLost,
            "roundsWon" : self.roundsWon,
            "id" : self.id
        ]
    }
}
