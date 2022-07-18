//
//  AddNewJournal.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/18/22.
//

import SwiftUI

struct AddNewJournal: View {
    var body: some View {
        Form{
            Section(header: Text("Location")){
                
            }
            Section(header: Text("Title")){
                //TextField("Title", text:)
            }
            Section(header: Text("Journal Entry")){
                
            }
        }
    }
}

struct AddNewJournal_Previews: PreviewProvider {
    static var previews: some View {
        AddNewJournal()
    }
}
