//
//  ViewIndividualJournal.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/14/22.
//

import SwiftUI

struct ViewIndividualJournal: View {
    let entry: JournalEntry
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(entry.title)
                    .font(.subheadline)
                Text("by " + entry.author)
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
            }
                
            HStack(alignment: .bottom) {
                Text(entry.body)
                    .frame(width: 240, height: 50, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                VStack (alignment:.leading) {
                    NavigationLink(destination: MainView()){
                        ViewJournalButton()
                    }
                    Label("Save", systemImage: "archivebox")
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

struct ViewIndividualJournal_Previews: PreviewProvider {
    static var entry = JournalEntry.sampleData[0]
    static var previews: some View {
        ViewIndividualJournal(entry: entry)
            //.previewLayout(.fixed(width: 350, height: 80))
    }
}
