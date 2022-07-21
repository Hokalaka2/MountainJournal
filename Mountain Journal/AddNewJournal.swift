//
//  AddNewJournal.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/18/22.
//

import SwiftUI

struct AddNewJournal: View {
    @Binding var isPresenting: Bool
    @Environment(\.managedObjectContext) private var viewContext
    @State private var author = ""
    @State private var text = ""
    
    var body: some View {
        Form{
            Section(header: Text("Author")){
                TextField("Author", text:$author)
            }
            Section(header: Text("Text")){
                TextEditor(text: $text)
                    .frame(height:100)
                
            }
        }
        .toolbar{
            ToolbarItem(placement: .confirmationAction){
                Button(action: {
                    withAnimation {
                        let note = Note(context: viewContext)
                        note.id = UUID()
                        note.timestamp = Date()
                        note.author = self.author
                        note.text = self.text
                        isPresenting = false
                        do {
                            try viewContext.save()
                            author = ""
                            text = ""
                            print("Saved")
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }) {
                    Text("Publish")
                }
                .disabled(author.isEmpty || text.isEmpty)
            }
        }
            
        
    }
}

struct AddNewJournal_Previews: PreviewProvider {
    @State static var isPresenting = true
    static var previews: some View {
        AddNewJournal(isPresenting: $isPresenting)
    }
}
