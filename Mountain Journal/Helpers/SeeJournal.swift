//
//  SeeJournal.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/11/22.
//

import SwiftUI
import MapKit

struct SeeJournal: View {
    
    var body: some View {
        VStack{
            Image(systemName: "note.text")
                .resizable()
                .frame(width: 35.0, height: 35.0)
            Text("See")
                .font(.subheadline)
            Text("Journals")
                .font(.subheadline)
        }
        .padding()
        .background(Color.white)
    }
}

struct SeeJournal_Previews: PreviewProvider {
    static var previews: some View {
        SeeJournal()
            .previewLayout(.sizeThatFits)
    }
}
