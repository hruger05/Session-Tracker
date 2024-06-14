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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack{
                    Text("Valorant Session Stats")
                        .padding(.top, 50)
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                    List {
                        ForEach(valVM.sessions) { session in
                            NavigationLink(destination: valorantIndividualSessionView(session: session)) {
                                Text("\(session.totalkills) / \(session.totaldeaths) / \(session.totalAssists)")
                                    .font(.title3)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding()
                }
                .onAppear {
                    valVM.observeSessionsFromFirebase()
                }
            }
            .ignoresSafeArea()
        }

    }
}

#Preview {
    valorantSessionsView()
        .environmentObject(ValVM())
}
