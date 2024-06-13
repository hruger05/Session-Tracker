//
//  matchModel.swift
//  SessionTracker 2.0
//
//  Created by Michael Potter on 6/11/24.
//

import Foundation
import Firebase


class valMatchModel: ObservableObject {
    var kills: Int
    
    var deaths: Int
    
    var win: Bool
    
    var assists: Int
    
    var ACS: Int
    
    var roundsWon: Int
    
    var roundsLost: Int
    
    var created: Timestamp
    
    init(kills: Int = 1, deaths: Int = 1, win: Bool = false, assists: Int = 1, ACS: Int = 1, roundsWon: Int = 1, roundsLost: Int = 1, created: Timestamp = Timestamp()) {
        self.kills = kills
        self.deaths = deaths
        self.win = win
        self.assists = assists
        self.ACS = ACS
        self.roundsWon = roundsWon
        self.roundsLost = roundsLost
        self.created = created
    }
    
    func makeModel(kills: Int, deaths: Int, win: Bool, assists: Int, ACS: Int, roundsWon: Int, roundsLost: Int, created: Timestamp = Timestamp()) -> [String : Any] {
        return [
            "kills" : kills,
            "deaths" : deaths,
            "win" : win,
            "assists" : assists,
            "ACS" : ACS,
            "roundsWon" : roundsWon,
            "roundsLost" : roundsLost,
            "created" : created
        ]
    }
}
