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
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [])
    var pins: FetchedResults<Pin>
    
    @Binding var userProfile: Profile
    
    @State private var isPresenting = false
    @State private var selectedItem = 1
    
    var body: some View {
        TabView(selection: $selectedItem){
            MapView(pins: pins)
                .tabItem {
                    Label("Map", systemImage: "map")
                    Text("Map")
                }.tag(1)
            ProfileView(userProfile: $userProfile)
                .tabItem{
                    Label("Profile", systemImage: "person")
                    Text("Notes")
                }.tag(2)
            
            Text("")
                .tabItem{
                    Label("Add New Entry", systemImage: "plus")
                    Text("Add New Entry")
                }.tag(3)
                .onAppear(){
                    self.isPresenting = true
                }
            
            ViewAllJournals(userProfile: userProfile)
                .tabItem{
                    Label("Location", systemImage: "pin")
                    Text("Location")
                }.tag(4)
            
            ViewAllJournals(userProfile: userProfile)
                .tabItem{
                    Label("My Notes", systemImage: "note.text")
                    Text("My Notes")
                }.tag(5)
        }
        
        .sheet(isPresented: $isPresenting, onDismiss: {
                        self.selectedItem = 1
                    }) {
                        NavigationView {
                            AddNewJournal(isPresenting: $isPresenting, userProfile: userProfile)
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
    @State static var userProfile = Profile.empty
    static var previews: some View {
        MainView(userProfile: $userProfile)
    }
}
