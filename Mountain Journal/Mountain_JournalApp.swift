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
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


