//
//  ViewSavedJournals.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 8/16/22.
//

import SwiftUI

struct ViewSavedJournals: View {
    var userProfile: Profile
    
    @FetchRequest var saved: FetchedResults<SavedNote>
    @Environment(\.managedObjectContext) private var viewContext
    
    init(userProfile: Profile){
        self.userProfile = userProfile
        
        let predicate = NSPredicate(format: "author == %@", self.userProfile.name)
        
        self._saved = FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: false)], predicate: predicate)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Saved Journals")
                        .font(.headline)
                        
                    ForEach(saved) { isaved in
                        ViewIndividualSavedJournal(entry: isaved)
                    }
                }
                .padding()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .foregroundColor(.black)
        
    }
}

struct ViewSavedJournals_Previews: PreviewProvider {
    @State static var userProfile = Profile.empty
    static var previews: some View {
        ViewSavedJournals(userProfile: userProfile)
    }
}
