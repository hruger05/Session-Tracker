//
//  valorantSessionsView.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 6/11/24.
//

import SwiftUI
import Firebase

struct valorantSessionsView: View {
    
    @EnvironmentObject var valVM: ValVM
    var totalKills: Int {
        var kills = 0
        valVM.sessions.forEach { session in
            session.matches.forEach { match in
                kills += match["kills"] as? Int ?? -1
                }
            }
        return kills
        }
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.indigo
                
                VStack{
                    List {
                        ForEach(valVM.sessions) { session in
                            NavigationLink(destination: valorantIndividualSessionView(session: session)) {
                                Text("\(session.id)")
                            }
                        }
                    }
                }
                .onAppear {
                    valVM.observeSessionsFromFirebase()
                }
            }
        }
    }
}

#Preview {
    valorantSessionsView()
        .environmentObject(ValVM())
}
