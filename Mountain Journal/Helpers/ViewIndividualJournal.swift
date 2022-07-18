//
//  ViewIndividualJournal.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/14/22.
//

import SwiftUI

struct ViewIndividualJournal: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("User's Name")
                .font(.headline)
                .padding([.leading, .bottom], 10)
            HStack(alignment: .bottom) {
                Text("Insert Text Here: Otis is really stupid, this text pennnnis is just testing what multiline will look like so please dont take offense. Still part of the test still part of test almost done test tes test test")
                    .lineLimit(3)
                    .padding(.leading,12)
                VStack (alignment:.leading) {
                    NavigationLink(destination: MainView()){
                        ViewJournalButton()
                    }
                    Label("Save", systemImage: "archivebox")
                }
                .padding(.trailing,15)
            }
            .font(.caption)
            
            
        }
    }
}

struct ViewIndividualJournal_Previews: PreviewProvider {
    static var previews: some View {
        ViewIndividualJournal()
            //.previewLayout(.fixed(width: 350, height: 80))
    }
}
