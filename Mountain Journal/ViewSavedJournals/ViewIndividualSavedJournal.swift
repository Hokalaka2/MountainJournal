//
//  ViewIndividualSavedJournal.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 8/16/22.
//

import SwiftUI

struct ViewIndividualSavedJournal: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let entry: SavedNote
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(entry.title ?? "No title")
                    .font(.subheadline)
                Text("by \(entry.author ?? "No Author")")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
            }
                
            HStack(alignment: .bottom) {
                Text(entry.text ?? "No Body")
                    .frame(width: 240, height: 50, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                VStack (alignment:.leading) {
                    NavigationLink(destination: ExpandedSavedJournalView(entry: entry)){
                        Label("View Journal", systemImage: "arrow.right")
                            .padding(.bottom, 10)
                    }
                    Button(action: {
                        withAnimation {
                            let SNote = SavedNote(context: viewContext)
                            SNote.id = entry.id
                            SNote.timestamp = entry.timestamp
                            SNote.author = entry.author
                            SNote.title = entry.title
                            SNote.text = entry.text
                            SNote.latitude = entry.latitude
                            SNote.longitude = entry.longitude
                            
                        }
                    }) {
                        Label("Save", systemImage: "archivebox")
                            .foregroundColor(.black)
                    }
                    
                }
                .padding(.trailing,15)
            }
            .font(.caption)
            
            Rectangle()
                .fill(.gray)
                .frame(width: 350, height:1, alignment: .center)
            
        }
    }
}

struct ViewIndividualSavedJournal_Previews: PreviewProvider {
    static var viewContext = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let entry = SavedNote(context: viewContext)
        entry.title = "Title"
        entry.text = "text"
        
        return ViewIndividualSavedJournal(entry: entry).environment(\.managedObjectContext, viewContext)
    }
}
