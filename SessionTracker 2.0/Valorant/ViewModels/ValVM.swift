//
//  ValVM.swift
//  SessionTracker 2.0
//
//  Created by Michael Potter on 6/11/24.
//

import Foundation
import Firebase

class ValVM: ObservableObject {
    @Published var sessions: [valSessionModel] = []
    
    let db = Firestore.firestore()
    
    func saveToFirebase(ses: valSessionModel) {
        db.collection("Games/Valorant/Sessions").document(ses.id).setData(ses.toDictionaryValues()) { error in
            if let err = error {
                print("\(err)")
            } else {
                print("Successfully sent data to firbase")
            }
        }
        
    }
    
    func observeSessionsFromFirebase() {
        db.collection("Games/Valorant/Sessions").addSnapshotListener { snapshot, error in
            if let err = error {
                print("\(err.localizedDescription)")
                return
            }
            self.sessions.removeAll()
            if let snap = snapshot {
                for item in snap.documents {
                    let stat = valSessionModel(data: item.data())
                    self.sessions.append(stat)
                }
            }
        }
    }
}
