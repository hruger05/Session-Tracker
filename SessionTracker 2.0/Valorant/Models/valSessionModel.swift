//
//  valSessionModel.swift
//  SessionTracker 2.0
//
//  Created by Michael Potter on 6/11/24.
//

import Foundation

class valSessionModel: ObservableObject, Identifiable {
    
    var numMatches: Int
    
    var matches: [[String : Any]]
    
    var id: String = UUID().uuidString
    
    var totalkills: Int {
        var kills = 0
        matches.forEach { match in
            kills += match["kills"] as? Int ?? -100
        }
        return kills
    }
    
    var totaldeaths: Int {
        var deaths = 0
        matches.forEach { match in
            deaths += match["deaths"] as? Int ?? -100
        }
        return deaths
    }
    
    var totalACS: Int {
        var ACS = 0
        matches.forEach { match in
            ACS += match["ACS"] as? Int ?? -100
        }
        return ACS
    }
    
    var totalRoundsWon: Int {
        var roundsWon = 0
        matches.forEach { match in
            roundsWon += match["roundsWon"] as? Int ?? -100
        }
        return roundsWon
    }
    
    var totalRoundsLost: Int {
        var roundsLost = 0
        matches.forEach { match in
            roundsLost += match["roundsLost"] as? Int ?? -100
        }
        return roundsLost
    }
    
    var totalAssists: Int {
        var assists = 0
        matches.forEach { match in
            assists += match["assists"] as? Int ?? -100
        }
        return assists
    }
    
    var totalWins: Int {
        var wins = 0
        matches.forEach { match in
            wins += match["win"] as? Int ?? -100
        }
        return wins
    }
    
    init(numMatches: Int, matches: [[String : Any]]) {
        self.numMatches = numMatches
        self.matches = matches
    }
    
    init(data: [String : Any]) {
        self.numMatches = data["numMatches"] as? Int ?? -1
        self.matches = data["matches"] as? [[String : Any]] ?? [["none" : "none"]]
        self.id = data["id"] as? String ?? "NO_ID"
    }
    
    func toDictionaryValues() -> [String : Any] {
        return [
            "numMatches" : self.numMatches,
            "matches" : self.matches,
            "id" : self.id
        ]
        
    }
}
