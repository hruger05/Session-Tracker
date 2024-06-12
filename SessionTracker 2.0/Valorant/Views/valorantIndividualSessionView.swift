//
//  valorantIndividualSessionView.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 6/11/24.
//

import SwiftUI

struct valorantIndividualSessionView: View {
    
    @State var session: valSessionModel
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Total Kills: \(session.totalkills)")
                Text("Total Deaths: \(session.totaldeaths)")
                Text("Total ACS: \(session.totalACS)")
                Text("Total Rounds Won: \(session.totalRoundsWon)")
                Text("Total Rounds Lost: \(session.totalRoundsLost)")
                Text("Total Assists: \(session.totalAssists)")
                Text("Total wins: \(session.totalWins)")
            }
        }
    }
}
