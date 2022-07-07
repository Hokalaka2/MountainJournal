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
            MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
        }
    }
}
