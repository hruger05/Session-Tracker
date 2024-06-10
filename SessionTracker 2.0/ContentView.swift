//
//  ContentView.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var firebaseService: FirebaseService
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.blue
                
                VStack {
                    Text("Valorant Session Tracker")
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                        .padding(.top, 55)
                    HStack{
                        Text("Total wins: \(firebaseService.totalWins)")
                            .padding(10)
                            .foregroundStyle(Color.green)
                            .font(.system(size: 25))
                        Text("Total losses: \(firebaseService.totalLosses)")
                            .padding(10)
                            .foregroundStyle(Color.red)
                            .font(.system(size: 25))
                    }
                    Text("Win Percentage: \(forTrailingZero(firebaseService.winPercentage))%")
                        .padding(10)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 25))
                    HStack{
                        Text("Total kills: \(firebaseService.totalKills)")
                            .padding(10)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                        Text("Total deaths: \(firebaseService.totalDeaths)")
                            .padding(10)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                    }
                    Text("K/D: \(forTrailingZero(firebaseService.totalKD))")
                        .padding(10)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 25))
                    Text("Average ACS: \(forTrailingZero(firebaseService.averageACS))")
                        .padding(.top, 10)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 25))
                    List {
                        ForEach(firebaseService.gameStats) {
                            stat in
                                VStack {
                                    Text("\(stat.didWin ? "WIN" : "LOSS")")
                                        .foregroundStyle(stat.didWin ? Color.green : Color.red)
                                        .font(.largeTitle)
                                    HStack {
                                        Text("round wins: \(stat.roundsWon)")
                                        Spacer()
                                        Text("Rounds lost: \(stat.roundsLost)")
                                    }
                                    .foregroundStyle(Color.black)
                                    HStack{
                                        Text("Kills: \(forTrailingZero(stat.kills))")
                                        Spacer()
                                        Text("Deaths: \(forTrailingZero(stat.deaths))")
                                    }
                                    .foregroundStyle(Color.black)
                                    Text("K/D: \(forTrailingZero(stat.kills / stat.deaths))")
                                        .foregroundStyle(Color.black)
                                    Text("ACS: \(stat.ACS)")
                                        .foregroundStyle(Color.black)
                                }
                                .listRowBackground(stat.didWin ? Color.green.opacity(0.5) : Color.red.opacity(0.5))
                        }
                    }
                    .listStyle(.plain)
                    NavigationLink(destination: matchSummary()) {
                        Text("Record Match")
                            .foregroundStyle(Color.blue)
                            .font(.title2)
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 20.0))
                            .foregroundStyle(Color.white)
                    }
                    
                        .padding()
                }
            }
            .ignoresSafeArea()
            .onAppear(perform: {
                firebaseService.observeGameStatsFromFirebase()
            })
        }
    }
    func forTrailingZero(_ temp: Double) -> String {
        var tempVar = String(format: "%g", temp)
        return tempVar
    }
}

#Preview {
    ContentView()
        .environmentObject(FirebaseService())
}

