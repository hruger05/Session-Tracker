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
                            [
                            "kills" : 2,
                            "deaths" : 3
                            ],
                            [
                            "kills" : 30,
                            "deaths" : 20
                            ]
                            ])
                        )
                    }, label: {
                        Text("Button").foregroundStyle(.red)
                    })
                    List {
                        ForEach(ValVM.sessions) { session in
                            Text("\(session.matches[0]["kills"] ?? "none")")
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

