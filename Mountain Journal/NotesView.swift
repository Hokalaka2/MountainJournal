//
//  NotesView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/8/22.
//

import SwiftUI

struct NotesView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: true)],
            animation: .default)
    private var notes: FetchedResults<Note>
    
    var body: some View {
        Text("Journal Entries")
        List{
            ForEach(notes) { note in
                Text("Author:  \(note.author ?? "otis")")
                Text("Text: \(note.text ?? "otis")")
                Text("Date: \(note.timestamp ?? Date())")
            }
        }
        
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
