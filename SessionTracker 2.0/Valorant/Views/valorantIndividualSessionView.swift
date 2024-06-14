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
            ZStack{
                Color.indigo
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack{
                    HStack{
                        Text("Total Kills: \(session.totalkills)")
                        
                        Text("Total Deaths: \(session.totaldeaths)")
                    }
                    Text("Total Assists: \(session.totalAssists)")
                    HStack{
                        Text("Total Rounds Won: \(session.totalRoundsWon)")
                        
                        Text("Total Rounds Lost: \(session.totalRoundsLost)")
                    }
                    Text("Total wins: \(session.totalWins)")
                    
                    Text("Total ACS: \(session.totalACS)")
                    
                    Text("Created: \(session.created.dateValue())")
                }
                .foregroundStyle(Color.white)
            }
            .ignoresSafeArea()
        }
    }
}
