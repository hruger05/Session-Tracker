//
//  ContentView.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var firebaseService: FirebaseViewModel
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
                        Image("Valorant")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .frame(width: 370, height: 100)
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(FirebaseViewModel())
}

