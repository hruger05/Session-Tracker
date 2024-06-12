//
//  ContentView.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var firebaseService: FirebaseViewModel
    @EnvironmentObject var ValVM: ValVM
    @StateObject var matchVM: matchModel = matchModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color.blue
                    
                VStack{
                   Text("Session Tracker")
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                        .padding(55)
                    
                    NavigationLink(destination: valorantStatsView()) {
                        Image("valorant")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .frame(width: 370, height: 100)
                    }
                    Button(action: {
                        ValVM.saveToFirebase(ses: valSessionModel(numMatches: 2, matches: [
                            matchVM.makeModel(kills: 25, deaths: 14, win: true, assists: 5, ACS: 200, roundsWon: 13, roundsLost: 8),
                            matchVM.makeModel(kills: 22, deaths: 17, win: true, assists: 7, ACS: 176, roundsWon: 13, roundsLost: 10)
                            ])
                        )
                    }, label: {
                        Text("Button").foregroundStyle(.red)
                    })
                    List {
                        ForEach(ValVM.sessions) { session in
                            
                            ForEach(session.matches.indices) { match in
                                Text("\(session.matches[match]["ACS"] ?? "none")")
                            }
                        }
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }.onAppear {
            ValVM.observeSessionsFromFirebase()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(FirebaseViewModel())
        .environmentObject(ValVM())
}

