//
//  ViewAllJournals.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/14/22.
//

import SwiftUI

struct ViewAllJournals: View {
    var userProfile: Profile
    
    @FetchRequest var entries: FetchedResults<Note>
    @Environment(\.managedObjectContext) private var viewContext
    
    init(userProfile: Profile){
        self.userProfile = userProfile
        
        let predicate = NSPredicate(format: "author == %@", self.userProfile.name)
        
        self._entries = FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: false)], predicate: predicate)
    }
    
    var body: some View {

        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.gray)
            NavigationView {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Your Journals")
                            .font(.headline)
                            
                        ForEach(entries) { testEntry in
                            ViewIndividualJournal(entry: testEntry)
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
        
}

struct ViewAllJournals_Previews: PreviewProvider {
    @State static var userProfile = Profile.empty
    static var previews: some View {
        ViewAllJournals(userProfile: userProfile)
    }
}
