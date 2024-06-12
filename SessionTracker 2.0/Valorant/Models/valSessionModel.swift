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
