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
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    Text("Journals")
                        .font(.headline)
                    ViewIndividualJournal()
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 400, height:1)
                    ViewIndividualJournal()
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 400, height:1)
                    ViewIndividualJournal()
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 400, height:1)
                    ViewIndividualJournal()
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 400, height:1)
                    ViewIndividualJournal()
                }
                .padding()
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .foregroundColor(.black)
    }
}

struct ViewAllJournals_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllJournals()
    }
}
