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
    @State private var title = ""
    @State private var text = ""
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        Form{
            Section(header: Text("Author")){
                TextField("Author", text:$author)
            }
            Section(header: Text("Title")){
                TextField("Title", text: $title)
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
                        note.title = self.title
                        note.text = self.text
                        note.latitude = locationManager.lastLocation?.coordinate.latitude ?? 0.0
                        note.longitude = locationManager.lastLocation?.coordinate.longitude ?? 0.0
                        isPresenting = false
                        do {
                            try viewContext.save()
                            author = ""
                            title = ""
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
