//
//  ExpandedJournalView.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/24/22.
//

import SwiftUI

struct ExpandedJournalView: View {
    
    let entry: Note
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                Text(entry.title ?? "No title")
                    .font(.subheadline)
                Text("by \(entry.author ?? "No Author")")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
                
            }
            Rectangle()
                .fill(.gray)
                .frame(width: 350, height:1, alignment: .center)
            
            HStack {
                Text("\(entry.author ?? "No Author")")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
                    
                    .padding( .leading, 25.0)
                    .padding(.top, 10.0)
                Spacer()
                Text("\(entry.timestamp ?? Date())")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
                    .padding(.trailing, 25.0)
                    .padding(.top, 10.0)
            }
        }
    }
}

struct ExpandedJournalView_Previews: PreviewProvider {
    
    static var viewContext = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
    
        let entry = Note(context: viewContext)
        entry.title = "Title"
        entry.text = "text"
        
        return ExpandedJournalView(entry: entry).environment(\.managedObjectContext, viewContext)
    }
}
