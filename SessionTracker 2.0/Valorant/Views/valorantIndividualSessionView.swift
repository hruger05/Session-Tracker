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
                Text("\(session.matches)")
            }
        }
    }
}
