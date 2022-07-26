//
//  ViewAllJournals.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/14/22.
//

import SwiftUI

struct ViewAllJournals: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: false)],
            animation: .default)
    private var entries: FetchedResults<Note>
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Journals")
                        .font(.headline)
                        .padding(.leading)
                        
                    ForEach(entries) { testEntry in
                        ViewIndividualJournal(entry: testEntry)
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

struct ViewAllJournals_Previews: PreviewProvider {
    
    static var previews: some View {
        ViewAllJournals()
    }
}
