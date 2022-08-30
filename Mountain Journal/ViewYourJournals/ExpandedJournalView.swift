//
//  ExpandedJournalView.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/24/22.
//

import SwiftUI

struct ExpandedJournalView: View {
    
    let entry: Note
    
    let screenSize = UIScreen.main.bounds.size
    
    
    
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
        
        let rectWidth = screenSize.width * (0.9)
        
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
                .frame(width: rectWidth, height:1, alignment: .center)
            
            ScrollView {
                Text("\(entry.text ?? "No body")")
                    .font(.body)
                    .frame(width: rectWidth, alignment: .center)
            }
                
            Rectangle()
                .fill(.gray)
                .frame(width: rectWidth, height:1, alignment: .center)
            
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

struct ExpandedJournalView_Previews: PreviewProvider {
    
    static var viewContext = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
    
        let entry = Note(context: viewContext)
        entry.title = "Title"
        entry.text = "text"
        
        return ExpandedJournalView(entry: entry).environment(\.managedObjectContext, viewContext)
    }
}
