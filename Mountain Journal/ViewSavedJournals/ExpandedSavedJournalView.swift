//
//  ExpandedSavedJournalView.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 8/16/22.
//

import SwiftUI

struct ExpandedSavedJournalView: View {
    
    let entry: SavedNote
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Label("", systemImage: "arrow.left")
                .padding(.leading)
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                btnBack
                Spacer()
                Text(entry.title ?? "No title")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.trailing, 35.0)
                Spacer()
                
            }
            .navigationBarBackButtonHidden(true)
            
            Rectangle()
                .fill(.gray)
                .frame(width: 350, height:1, alignment: .center)
            
            ScrollView {
                Text("\(entry.text ?? "No body")")
                    .font(.body)
                    .frame(width: 350, alignment: .center)
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
                    .padding([.top, .bottom], 15.0)
                Spacer()
                Text("\(entry.timestamp ?? Date(),style:.date)")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
                    .padding(.trailing, 25.0)
                    .padding([.top, .bottom], 15.0)
            }
        }
        .navigationBarHidden(true)
    }
}

struct ExpandedSavedJournalView_Previews: PreviewProvider {
    
    static var viewContext = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let entry = SavedNote(context: viewContext)
        entry.title = "Title"
        entry.text = "text"
        
        return ExpandedSavedJournalView(entry: entry).environment(\.managedObjectContext, viewContext)
    }
}
