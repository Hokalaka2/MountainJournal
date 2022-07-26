//
//  ViewJournalButton.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/18/22.
//

import SwiftUI

struct ViewJournalButton: View {
    var body: some View {
        Label("View Journal", systemImage: "arrow.right")
            .padding(.bottom, 10)
                    
    }
}

struct ViewJournalButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewJournalButton()
    }
}
