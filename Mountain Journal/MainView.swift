//
//  MainView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI
import MapKit
import CoreData

struct MainView: View {
    
    var body: some View {
        TabView{
            MapView(coordinate: CLLocationCoordinate2D(latitude: 44.015337, longitude: -73.16734))
                .tabItem {
                    Label("Map", systemImage: "map")
                    Text("Map")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                    Text("Notes")
                }
            
            //if User is in close enough area
            if(true){
                ProfileView()
                    .tabItem{
                        Label("Add New Entry", systemImage: "plus")
                        Text("Add New Entry")
                }
            }
            else{

            }
            NotesView()
                .tabItem{
                    Label("Location", systemImage: "pin")
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
