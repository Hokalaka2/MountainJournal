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
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.black)
                    .frame(width: 350, height: 770)
                
                VStack(spacing: 0) {
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
                .position(x: 200, y: 70)
                
            }
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
    }
}

struct ViewAllJournals_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllJournals()
    }
}
