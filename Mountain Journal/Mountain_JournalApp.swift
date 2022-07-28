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
        if isAuthenticated {
            MainView(userProfile: $userProfile)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        } else {
            LogInView(isAuthenticated: $isAuthenticated, userProfile: $userProfile)
        }
        }
    }
}

