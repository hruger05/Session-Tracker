//
//  SessionTracker_2_0App.swift
//  SessionTracker 2.0
//
//  Created by Hudson Ruger on 5/22/24.
//

//import SwiftUI
//
//@main
//struct SessionTracker_2_0App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SessionTracker: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationStack {
        ContentView()
              
      }
      .environmentObject(ValVM())
    }
  }
}
