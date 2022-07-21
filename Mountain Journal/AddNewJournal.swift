//
//  AddNewJournal.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/18/22.
//

import SwiftUI

struct AddNewJournal: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var author = ""
    @State private var text = ""
    var body: some View {
        Form{
            Section(header: Text("Author")){
                TextField("Title", text:$author)
            }
            Section(header: Text("Title")){
                TextField("Text", text: $text)
            }
            Button(action: {
                withAnimation {
                    let note = Note(context: viewContext)
                    note.id = UUID()
                    note.timestamp = Date()
                    note.author = self.author
                    note.text = self.text
                    do {
                        try viewContext.save()
                        print("Saved")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
        }
    }
}

struct AddNewJournal_Previews: PreviewProvider {
    static var previews: some View {
        AddNewJournal()
    }
}
