//
//  ViewAllJournals.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/14/22.
//

import SwiftUI

struct ViewAllJournals: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: MainView()){
                    ViewIndividualJournal()
                }
                NavigationLink(destination: MainView()){
                    ViewIndividualJournal()
                }
                NavigationLink(destination: MainView()){
                    ViewIndividualJournal()
                }
            }
            .navigationTitle("Journals")
        }
    }
}

struct ViewAllJournals_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllJournals()
    }
}
