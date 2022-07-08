//
//  MainView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI
import MapKit

struct MainView: View {
    var body: some View {
        TabView{
            MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
                .tabItem {
                    Label("Map", systemImage: "map")
                    Text("Map")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                    Text("Notes")
                }
            
            ProfileView()	
                .tabItem{
                    Label("Locations", systemImage: "pin")
                    Text("Location")

                }
            
            NotesView()
                .tabItem{
                    Label("My Notes", systemImage: "note.text")
                    Text("My Notes")

                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
