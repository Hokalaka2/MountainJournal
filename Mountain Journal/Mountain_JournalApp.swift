//
//  Mountain_JournalApp.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/2/22.
//

import SwiftUI
import Auth0
import MapKit

@main
struct Mountain_JournalApp: App {
    let persistenceController = PersistenceController.shared
    @State private var isAuthenticated = false
    @State var userProfile = Profile.empty
    
    var body: some Scene {
        WindowGroup {
//            MainView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        if isAuthenticated {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        } else {
            Button("Login"){
                login()
            }
        }
        }
    }
}
extension Mountain_JournalApp {
  
    func login() {
        Auth0 // 1
          .webAuth() // 2
          .start { result in // 3
            switch result {
              // 4
              case .failure(let error):
                print("Failed with: \(error)")
              // 5
              case .success(let credentials):
                self.isAuthenticated = true
                self.userProfile = Profile.from(credentials.idToken)
                print("Credentials: \(credentials)")
                print("ID token: \(credentials.idToken)")
            }
          }
      }
  
    func logout() {
        Auth0 // 1
          .webAuth() // 2
          .clearSession { result in // 3
            switch result {
              // 4
              case .failure(let error):
                print("Failed with: \(error)")
                // 5
              case .success:
                self.isAuthenticated = false
            }
          }
      }
}

