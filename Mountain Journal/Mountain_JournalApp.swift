//
//  Mountain_JournalApp.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/2/22.
//

import SwiftUI

@main
struct Mountain_JournalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
