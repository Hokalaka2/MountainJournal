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
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: true)],
            animation: .default)
    private var notes: FetchedResults<Note>
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [])
        var pins: FetchedResults<Pin>
    
    @State private var isPresenting = false
    @State private var selectedItem = 1
    @State private var oldSelectedItem = 1
    
    var body: some View {
        TabView(selection: $selectedItem){
            MapView(coordinate: CLLocationCoordinate2D(latitude: 44.015337, longitude: -73.16734), pins: pins)
                .tabItem {
                    Label("Map", systemImage: "map")
                    Text("Map")
                }.tag(1)
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                    Text("Notes")
                }.tag(2)
            
            AddNewJournal()
                .tabItem{
                    Label("Add New Entry", systemImage: "plus")
                    Text("Add New Entry")
                }.tag(3)
                .onAppear(){
                    self.isPresenting = true
                }
            
            NotesView()
                .tabItem{
                    Label("Location", systemImage: "pin")
                    Text("Location")

                }.tag(4)
            
            NotesView()
                .tabItem{
                    Label("My Notes", systemImage: "note.text")
                    Text("My Notes")

                }.tag(5)
        }
        .sheet(isPresented: $isPresenting, onDismiss: {
                        self.selectedItem = self.oldSelectedItem
                    }) {
                        NavigationView {
                            AddNewJournal()
                                .toolbar{
                                    ToolbarItem(placement: .cancellationAction){
                                        Button("Dismiss"){
                                            isPresenting = false
                                        }
                                    }
                                }
                        }
                }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
