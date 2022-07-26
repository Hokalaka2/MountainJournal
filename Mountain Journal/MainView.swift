//
//  MainView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI
import Auth0
import MapKit
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [])
        var pins: FetchedResults<Pin>
    
    @State private var isPresenting = false
    @State private var selectedItem = 1
    
    @State private var isAuthenticated = false
    
    var body: some View {
        TabView(selection: $selectedItem){
            MapView(pins: pins)
                .tabItem {
                    Label("Map", systemImage: "map")
                    Text("Map")
                }.tag(1)
            ProfileView()
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
            
            ViewAllJournals()
                .tabItem{
                    Label("Location", systemImage: "pin")
                    Text("Location")
                }.tag(4)
            
            ViewAllJournals()
                .tabItem{
                    Label("My Notes", systemImage: "note.text")
                    Text("My Notes")
                }.tag(5)
        }
        
        .sheet(isPresented: $isPresenting, onDismiss: {
                        self.selectedItem = 1
                    }) {
                        NavigationView {
                            AddNewJournal(isPresenting: $isPresenting)
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

extension MainView {
  
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
