//
//  SessionTracking.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 5/22/24.
//

import SwiftUI

struct GameStat: Identifiable, Codable {
    var didWin:Bool
    var kills:Double
    var deaths:Double
    var ACS:Int
    var id: String = UUID().uuidString
}
