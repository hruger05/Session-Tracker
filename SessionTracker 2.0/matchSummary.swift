//
//  matchSummary.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 5/29/24.
//

import Foundation
import SwiftUI

struct matchSummary: View {
    @Environment(\.dismiss) private var dismiss
    // win and lose variables
    @State var win = 0
    @State var lose = 0
    @State var didWin = false
    // textfield variables
    @State var bindRoundsWon = 0
    @State var bindRoundsLost = 0
    // round variables
    @State var roundsWon = 0
    @State var roundsLost = 0
    // Calc variables
    @State var eWin = 0.0
    @State var eMatches = 0.0
    @State var inteMatches = 0
    // outcome variables
    // Win %
    @State var outcome1 = "NA"
    // KD
    @State var outcome2 = "NA"
    // ACS
    @State var outcome3 = "NA"
    // kd variables
    @State var kills = 0.0
    @State var bindKills = 0.0
    @State var deaths = 0.0
    @State var bindDeaths = 0.0
    // Average Combat Score variables
    @State var ACS = 0
    @State var bindACS = 0
//    @StateObject var firebaseService = FirebaseService()
    @EnvironmentObject var firebaseService: FirebaseService
    
    var body: some View {
            ZStack{
                
                Color.blue
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Text("Valorant Session Tracker")
                        .foregroundStyle(Color.white)
                        .font(.largeTitle)
                        .padding(.vertical, 45)
                    HStack{
                        
                        Button(action: {
                            win += 1
                            eWin += 1
                            eMatches += 1
                            inteMatches += 1
                            didWin = true
                        }, label: {
                            Text("Win")
                                .foregroundStyle(Color.white)
                                .frame(width: 100, height: 100)
                                .background(Circle())
                                .foregroundStyle(Color.green)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                        })
                        
                        Button(action: {
                            lose += 1
                            eMatches += 1
                            inteMatches += 1
                            didWin = false
                        }, label: {
                            Text("Lose")
                                .foregroundStyle(Color.white)
                                .frame(width: 100, height: 100)
                                .background(Circle())
                                .foregroundStyle(Color.red)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                        })
                    }
                    HStack{
                        Text("Rounds Won")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                            .padding(.horizontal)
                        
                        Text("Rounds Lost")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                            .padding(.horizontal)
                    }
                    HStack{
                        TextField("Rounds Won", value: $roundsWon, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 5)
                        
                        TextField("Rounds Won", value: $roundsLost, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 5)
                    }
                    Divider()
                    HStack{
                        Text("Kills")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                            .padding()
                            .padding(.horizontal, 45)
                        Spacer()
                        Text("Deaths")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                            .padding()
                            .padding(.horizontal, 45)
                    }
                    HStack{
                        TextField("Enter kills", value: $kills, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 5)
                        
                        TextField("Enter deaths", value: $deaths, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 5)
                    }
                    Divider()
                    
                    Text("ACS")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 25))
                        .padding(.vertical, 5)
                    
                    TextField("Enter ACS", value: $ACS, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .frame(width: 150)
                    
                    Button(action: {
                        let newStat = GameStat(didWin: didWin, kills: kills, deaths: deaths, ACS: ACS, roundsLost: roundsLost, roundsWon: roundsWon)
                        firebaseService.saveGameStatToFirebase(gameStat: newStat)
                        dismiss()
                    }, label: {
                        Text("Submit Match")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 30))
                    })
                }
            }
            .ignoresSafeArea()
//            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
//                                .onEnded({ value in
//                                    if value.translation.width < 0 {
//                                        // left
//                                        print("Swiped left")
//                                    }
//
//                                    if value.translation.width > 0 {
//                                        // right
//                                        dismiss()
//                                    }
//                                    if value.translation.height < 0 {
//                                        // up
//                                    }
//
//                                    if value.translation.height > 0 {
//                                        // down
//                                    }
//                                }))
    }
        func forTrailingZero(_ temp: Double) -> String {
            var tempVar = String(format: "%g", temp)
            return tempVar
        }
    }

#Preview {
    matchSummary()
        .environmentObject(FirebaseService())
}
